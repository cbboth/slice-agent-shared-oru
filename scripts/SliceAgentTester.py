# -*- coding: utf-8 -*-
"""
Created on Fri Apr 12 00:29:13 2024

@author: Arnhold
"""

CMD_SETFRAMEID = 0xA0 
CMD_SETSUBFRAMEID = 0xA1
CMD_SETSLOTID = 0xA2
CMD_SETMU = 0xA3
CMD_SETSLOTSTEP = 0xA4 
CMD_SETMAXSLOTID = 0xA5
CMD_SETSYMBPERIOD = 0xA6
CMD_SETSLOTPERIOD = 0xA7
CMD_SETMINPROCTIME = 0xA8
CMD_SETIQNUM = 0xA9
CMD_SETIQWIDTH = 0xAA
CMD_SETMAXPRB = 0xAB
CMD_STARTEMU = 0xB0
CMD_STOPEMU = 0xB1
CMD_SENDMETRICS = 0xB2
CMD_ADDSLICE = 0xB3
CMD_RMSLICE = 0xB4
CMD_ADDRECTIME = 0xB5
ETH_P_ALL = 0x0003

DBG_STATE_REC = 0x00
DBG_STATE_PROCS = 0x01
DBG_STATE_PROCE = 0x02
DBG_STATE_CAP = 0x03

import math
import numpy as np 
import serial
from scapy.all import *
import time
import binascii
import pandas as pd
from IPython import get_ipython
import matplotlib.pyplot as plt

get_ipython().magic('clear')
time.sleep(0.1)
# print("\033[H\033[J") 
ser = serial.Serial('COM4', 230400, timeout=10)  # open serial port
if ser.isOpen() == False:
    ser.open()
print(ser.name)

def swap64(i):
    return struct.unpack("<Q", struct.pack(">Q", i))[0]

def moutCplane(sliceP):
    bDat = bytearray(64)
    i64Dat = memoryview(bDat).cast('Q')
    i64Dat[0] = sliceP['dMAC']
    i64Dat[0] = ((i64Dat[0]<<16) & 0xFFFFFFFFFFFF0000) | ((sliceP['sMAC'] >> 32) & 0xFFFF)
    i64Dat[1] = sliceP['sMAC']
    i64Dat[1] = ((i64Dat[1]<<32) & 0xFFFFFFFF00000000) | (0x81000000) | (sliceP['vlan'] & 0xFFF)
    i64Dat[2] = (0xAEFE100200140000) | (sliceP['ecpriID'] & 0xFFFF)
    ids = (sliceP['subframeId'] << 12) | (sliceP['slotId'] << 6) | (sliceP['startSymb'])
    i64Dat[3] = (0x0000100000000101) | (sliceP['frameID'] << 32) | (ids << 16)
    i64Dat[4] = (0x0000000000000000) | (sliceP['startPRB'] << 24) | (sliceP['nPRB'] << 16) | sliceP['nSymb']
    i64Dat[5] = 0x00
    i64Dat[6] = 0x00
    i64Dat[7] = 0x00
    for j in range(8):
        i64Dat[j] = swap64(i64Dat[j])
    return bDat

def sendCMD(cmd, data):
    txBuff = [0x35, cmd, 0, 0, 0]
    txBuff[2] = data & 0xFF
    txBuff[3] = (data >> 8) & 0xFF
    txBuff[4] = (data >> 16) & 0xFF
    return ser.write(txBuff)

def dbgDecode(bData, nBuff):
    int_val = memoryview(bData).cast('Q')
    
    lEntry = []
    nW = nBuff/8
    for j in range(int(nW)):
        iVal = int_val[j]
        dat = {}
        dat['ecpri'] = iVal & 0xFFFF;
        dat['timestamp'] = (iVal>>16) & 0xFFFFFFFFFFF
        dat['step'] = (iVal>>60) & 0xF
        lEntry.append(dat)
    print ("Number of processings: ", len(lEntry))    
    return lEntry

def expectTempo(fid, sfid, sid, ssid):
    ret = fid*Tframe
    ret = ret + sfid*Tsubframe
    ret = ret + sid*Tslot
    return ret

def calcNxtIds(dat):
    if(dat['slotId'] == maxSlotId):
        dat['slotId'] = 0
        if(dat['subframeId'] == 0xF):
            dat['subframeId'] = 0
            if(dat['frameID'] == 0xFF):
                dat['subframeId'] = 0
            else:
                dat['frameID'] = dat['frameID'] + 1
        else:
            dat['subframeId'] = dat['subframeId'] + 1
    else:
        dat['slotId'] = dat['slotId'] + slotSetep
    return
        
def calcSlotOffset(dat, offset):
    for i in range(offset):
        calcNxtIds(dat)    
    return dat

def calClkNumber(fid, sfid, sid, maxSID):
    ret = fid * 0x09
    ret = ret + (sfid * maxSID)
    ret = ret + sid
    return ret

def sortArray(arr):
    n = len(arr)
    for i in range (n):
        for j in range (n - i - 1):
            swap = 0
            if arr[j]['frameID'] >= arr[j+1]['frameID']:
                if arr[j]['frameID'] == arr[j+1]['frameID']:
                    if arr[j]['subframeId'] >= arr[j+1]['subframeId']:
                        if arr[j]['subframeId'] == arr[j+1]['subframeId']:
                            if arr[j]['slotId'] > arr[j+1]['slotId']:
                                swap = 1
                            else:
                                swap = 0
                        else:
                            swap = 1
                    else:
                        swap = 0
                else:
                    swap = 1
            else:
                swap = 0

            if swap == 1:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

def sortDbg(dbg):
    n = len(dbg)
    for i in range(n):
        for j in range(n - i - 1):
            if dbg[j]['timestamp'] > dbg[j+1]['timestamp']:
                dbg[j], dbg[j + 1] = dbg[j + 1], dbg[j]

# Configuration
nPRB = 70                    # Radio Bandwidth
mu = 0                          # Numerology
time2proc = 80                  # Minimum time to process cplane messages in us
IQSize = 16                     # Width in bits of IQ sample. One RE has 32 bits (16 for I and 16 for Q)
nSlotsEmu = 1

# defaults
ETH_MTU = 1500
APP_HEADER = 8
FR = 1                          # FR1 (sub 6GHz)
freq = 100                      # frequency in MHz
Tclk = 1/freq                   # CLK period in us
Tframe = 10000                  # Frame period in us (fixed 10ms)
Tsubframe = Tframe/10           # Subframe period in us (1/10 of frame period)
Tslot = Tsubframe/pow(2,mu)     # Slot period in us. Depends on numerology
Tsymb = Tslot/14                # Symbol duration in us (1/14 of slot period)
ethSpeed = 1000                 # Ethernet speed in Mbps
cplaneFifo = 8192
nCplane = cplaneFifo/16
PRBSize = 12*2*IQSize/8
maxPrbPkt = (ETH_MTU - APP_HEADER - 8)/PRBSize

FIFO_T2_SIZE = 1025
FIFO_SYMB_SIZE = 130


slotSetep = 0
maxSlotId = 0

if(FR == 1):
    if (mu == 0):
        slotSetep = 0
        maxSlotId = 0
    elif (mu == 1):
        slotSetep = 2
        maxSlotId = 2
    elif (mu == 2):
        slotSetep = 1
        maxSlotId = 3
elif FR == 2:
    if (mu == 2):
        slotSetep = 4
        maxSlotId = 12
    elif (mu == 3):
        slotSetep = 2
        maxSlotId = 14
    elif (mu == 4):
        slotSetep = 1
        maxSlotId = 15



symbClk = math.ceil(Tsymb/Tclk)     # Number of FPGA clock to complete one symbol period
slotClk = symbClk*14            # Number of FPGA clock to complete one slot period
Tsymb = symbClk*Tclk
Tslot = Tsymb*14
Tsubframe = Tslot*pow(2,mu)
Tframe = Tsubframe*10
minTime2procClk = slotClk - round(time2proc/Tclk)     # Number of FPGA clock that represents the minimum time to process the Cplane msgs (ORAN T2a_min_cp_ul)
lowPhyIQNum = nPRB*12           # Number of IQ samples sent each symbol by the low phy.

reqSpeed = (IQSize*2*nPRB*12)/Tsymb     # The required fronthaul bw to send all radio bw. It only consider the IQ samples, the real number is larger.
bwAvailable = ethSpeed/reqSpeed
if (reqSpeed > ethSpeed):
    print("WARNING: the required fronthaul bw is larger than the actual (", reqSpeed, " Mbit/s > ", ethSpeed, " Mbit/s)")
    print("Maximum available bw: ~", bwAvailable, " %")
    
sFreameID = 0
sSubframeID = 0
sSlotID = 0

sendCMD(CMD_SETMU, int(mu));
sendCMD(CMD_SETIQWIDTH, int(IQSize))
sendCMD(CMD_SETMAXPRB, int(maxPrbPkt))
#sendCMD(CMD_SETMAXPRB, int(30))
sendCMD(CMD_SETSLOTSTEP, int(slotSetep));
sendCMD(CMD_SETMAXSLOTID, int(maxSlotId));
sendCMD(CMD_SETSYMBPERIOD, int(symbClk));
sendCMD(CMD_SETSLOTPERIOD, int(slotClk));
sendCMD(CMD_SETMINPROCTIME, int(minTime2procClk));
sendCMD(CMD_SETIQNUM, int(lowPhyIQNum));
sendCMD(CMD_SETFRAMEID, int(sFreameID));
sendCMD(CMD_SETSUBFRAMEID, int(sSubframeID));
sendCMD(CMD_SETSLOTID, int(sSlotID));

cfgSlices = []
for i in range(12):
    cfgSlices.append(0x3000 + i)
for sl in cfgSlices:
    sendCMD(CMD_ADDSLICE, sl);

#print(swapInt(0xDA020304))

#IFACES.show()
interface = IFACES.dev_from_index(20)


#dFrame = pd.read_excel('slices_gradual.xlsx')
dFrame = pd.read_excel('slices.xlsx', sheet_name="PowerTest")
slices = []
# for ind in dFrame.index:
#     data = {}
#     data['dMAC'] = 0xDA0203040506
#     data['sMAC'] = 0x74563CB3AADE
#     data['vlan'] = int(dFrame['Vlan'][ind])
#     data['frameID'] = int(dFrame['FrameID'][ind])
#     data['subframeId'] = int(dFrame['SubframeID'][ind])
#     data['slotId'] = int(dFrame['SlotID'][ind])
#     data['startPRB'] = int(dFrame['StartPRB'][ind])
#     data['nPRB'] = int(dFrame['nPRB'][ind])
#     data['nSymb'] = int(dFrame['nSymb'][ind])
#     data['ecpriID'] = int(dFrame['ecpriID'][ind])
#     data['startSymb'] = int(dFrame['StartSymb'][ind])
#     #print(expectTempo(data['frameID'], data['subframeId'], data['slotId'], data['startSymb']))
#     #print(calcSlotOffset(data.copy(), 3))
#     data['nPkt'] = math.ceil(data['nPRB']/maxPrbPkt)
#     nloops = math.ceil(nSlotsEmu/int(dFrame['SlotP'][ind]))
#     data_cpy = data.copy()
#     for j in range(nloops):
#         data = data_cpy.copy()
#         for k in range(int(dFrame['Nslot'][ind])):
#             slices.append(data)
#             data = data.copy()
#             if (k < int(dFrame['Nslot'][ind]) - 1):
#                 calcSlotOffset(data, 1)
#         calcSlotOffset(data_cpy, int(dFrame['SlotP'][ind]))
# #sortArray(slices)              

# for n in range(1):
#     for sym in range(14):
#         for prb in range(nPRB):
#             data = {}
#             data['dMAC'] = 0xDA0203040506
#             data['sMAC'] = 0x74563CB3AADE
#             data['vlan'] = int(192)
#             data['frameID'] = int(0)                        
#             data['slotId'] = int(0)
#             data['startPRB'] = prb
#             data['nPRB'] = int(1)
#             data['nSymb'] = int(1)
#             data['ecpriID'] = int(0xA0B0 + sym*nPRB + prb + n*14*nPRB)
#             if data['ecpriID'] < 0xA483:
#                 data['subframeId'] = int(2 + n)
#             else:
#                 data['subframeId'] = int(2 + n)
#             data['startSymb'] = sym
#             data['nPkt'] = math.ceil(data['nPRB']/maxPrbPkt)
            
#             slotTime = calClkNumber(0, n+1, 0, pow(2, mu)) * slotClk
#             slotTime = slotTime - 50000
#             sendCMD(CMD_ADDRECTIME, slotTime)
#             data['startStemp'] = slotTime
            
#             slices.append(data)         

# for n in range(1):
#     for sym in range(14):
#             data = {}
#             data['dMAC'] = 0xDA0203040506
#             data['sMAC'] = 0x74563CB3AADE
#             data['vlan'] = int(192)
#             data['frameID'] = int(0)                        
#             data['slotId'] = int(0)
#             data['startPRB'] = 0
#             data['nPRB'] = int(255)
#             data['nSymb'] = int(1)
#             data['ecpriID'] = int(0xA0B0 + sym + n*14)
#             if data['ecpriID'] < 0xA0BC:
#                 data['subframeId'] = int(1 + n)
#             else:
#                 data['subframeId'] = int(1 + n)
#             data['startSymb'] = sym
#             data['nPkt'] = math.ceil(data['nPRB']/maxPrbPkt)
            
#             slotTime = calClkNumber(0, n+1, 0, pow(2, mu)) * slotClk
#             slotTime = slotTime - 50000
#             sendCMD(CMD_ADDRECTIME, slotTime)
#             data['startStemp'] = slotTime
            
#             slices.append(data)
data = {}
## mMTC
data['dMAC'] = 0xDA0203040506
data['sMAC'] = 0x74563CB3AADE
data['vlan'] = int(299)
data['frameID'] = int(0)
data['nSymb'] = int(1)
data['nPRB'] = int(1)
for n in range(3):
    for nSl in range(1200):
        data['startPRB'] = nSl
        data['slotId'] = int(0)
        data['subframeId'] = int(3 + n)
        data['ecpriID'] = int(0x1000 + nSl + n*1200)
        data['startSymb'] = int(nSl/128)
        
        slotTime = calClkNumber(0, n+2, 0, pow(2, mu)) * slotClk
        slotTime = slotTime - np.random.normal(100000, 30000)
        if slotTime < 0:
            slotTime = 0
        #sendCMD(CMD_ADDRECTIME, slotTime)
        data['startStemp'] = int(slotTime)
        slices.append(data.copy())
        
#eMBB
data['nPRB'] = int(60)
data['vlan'] = int(291)
data['startPRB'] = 0
for n in range(3):
    for nSl in range(4):
        data['slotId'] = int(0)
        data['subframeId'] = int(2 + n)
        data['ecpriID'] = int(0x3000 + nSl + n*4)
        data['startSymb'] = int(1200/128) + 1 + nSl
        
        slotTime = calClkNumber(0, n+1, 0, pow(2, mu)) * slotClk
        slotTime = slotTime - np.random.normal(7500, 1000)
        if slotTime < 0:
            slotTime = 0
        data['startStemp'] = int(slotTime)
        slices.append(data.copy())
        
slices.sort(key=lambda x: x['startStemp'])   

L = 0
for pkt in slices:
    sendCMD(CMD_ADDRECTIME, pkt['startStemp'])
    packet = moutCplane(pkt)
    sendp(packet, iface=interface, verbose=0);
    L = L+1
        
b = bytearray(300000)
# ser.close()
sendCMD(CMD_STARTEMU, 0);
nBytes = ser.readinto(b)    # Timeout of 10 seconds
sendCMD(CMD_STOPEMU, 0);

#sendCMD(CMD_SENDMETRICS, 1);
dbgs = dbgDecode(b, nBytes)
sortDbg(dbgs)

print("Number of metrics: ", len(dbgs))


h = 0
err = []
rm = False
if len(dbgs) > 0:
    f = open("log.txt", "w")
    f1 = open("error.txt", "w")
    for sl in slices:
        dbg = {}
        rec = {}
        proc = {}
        cap = []
        capE = {}
        cnt = 0
        fsm = DBG_STATE_REC
        dbg_cpy = dbgs.copy()
        for entry in dbgs:
            if fsm == DBG_STATE_REC:
                if ((sl['ecpriID'] == entry['ecpri']) and (entry['step'] == 1)):
                    rec = entry.copy()
                    dbg['rec'] = rec['timestamp']
                    dbg_cpy.remove(entry)
                    fsm = DBG_STATE_PROCS
                    continue
            elif fsm == DBG_STATE_PROCS:
                if(sl['ecpriID'] == entry['ecpri']):
                    if (entry['step'] == 2) or (entry['step'] == 4):
                        proc['start'] = entry['timestamp']
                        dbg_cpy.remove(entry)
                        fsm = DBG_STATE_PROCE
                        continue
            elif fsm == DBG_STATE_PROCE:
                if(sl['ecpriID'] == entry['ecpri']):
                    if (entry['step'] == 3) or (entry['step'] == 5):
                        proc['end'] = entry['timestamp']
                        dbg_cpy.remove(entry)
                        dbg['proc'] = proc
                        fsm = DBG_STATE_REC
                        break
        sl['dbg'] = dbg
        dbgs = dbg_cpy
        h = h + 1    
        try:
            f.write("{:04d}".format(h) + ": " 
                    + hex(sl['ecpriID']) +
                  " - " + "{:09.2f}".format(sl['startStemp']/100) +
                  " - " + "{:09.2f}".format(dbg['rec']/100) +
                  " - " + "{:09.2f}".format(float(dbg['proc']['start']/100)) + 
                  " - " + "{:09.2f}".format(dbg['proc']['end']/100) + "\n")
        except:
            hstr = "{:04d}".format(h) + ": " + hex(sl['ecpriID']) + " - " + "{:09.2f}".format(sl['startStemp']/100)
            err.append(sl)
            if "rec" in dbg:
                hstr = hstr + " - " + "{:09.2f}".format(dbg['rec']/100)
                if "proc" in dbg:
                    proc = dbg['proc']
                    if "start" in dbg['proc']:
                        hstr = hstr + " - " + "{:09.2f}".format(float(dbg['proc']['start']/100))
                    else:
                        proc['start'] = dbg['rec']
                        hstr = hstr + " - " + "---------"
                    if "end" in dbg['proc']:
                        hstr = hstr + " - " + "{:09.2f}".format(float(dbg['proc']['end']/100))
                    else:
                        proc['end'] = dbg['rec']
                        hstr = hstr + " - " + "---------"
                else:
                    hstr = hstr + " - " + "---------" + " - " + "---------"
                    proc ={}
                    proc['start'] = dbg['rec']
                    proc['end'] = dbg['rec']
                    sl['dbg']['proc'] = proc
            else:
                hstr = hstr + " - " + "---------"
            f1.write(hstr + "\n")
            continue
    
    f.close()
    f1.close()


    slices.sort(key=lambda x:x['dbg']['proc']['end'])
    oc = np.zeros(slices[-1]['dbg']['proc']['end'])
    for sl in slices:
        iadd = sl['dbg']['rec']
        irm = sl['dbg']['proc']['start']
        oc[iadd] = oc[iadd] + 1
        oc[irm] = oc[irm] - 1
    
    f = open("fifoOc.txt", "w")
    oc2 = []
    f.write("{:09d}".format(int(oc[0])) + "\n")
    for i in range(1, len(oc)):
        oc[i] = oc[i] + oc[i-1]
        if((i%1000 == 0) or (i == len(oc)-1)):
            oc2.append(int(oc[i])/10.20)
            f.write("{:04.1f}".format(oc[i]/10.2) + "\n")
    f.close()
        
    
    for ent in dbgs:
        tus = ent['timestamp']/100
        if (ent['step'] < 6):
            print("eCPRI ID: ", hex(ent['ecpri']), "\t - \tTimestamp: ", "{:9.2f}".format(tus), " us\t - \tStep: ", ent['step'])
    
    i = 0
    ii = 0
    l = 0
    x1 = []
    tTotal = []
    sl = 0
    sl_t = 0
    k = 0
    ind = 0
    
    for s in slices:
        try:
            s['dbg']['rec'] = s['dbg']['rec'] - 8
            s['dbg']['proc']['start'] = s['dbg']['proc']['start'] - 8
            s['dbg']['proc']['end'] = s['dbg']['proc']['end'] - 8
            if (ii != 0):
                if((sl['frameID'] != s['frameID']) or (sl['subframeId'] != s['subframeId']) or (sl['slotId'] != s['slotId'])):
                    i = 0
                    k = k+1
            
            if i > 0:
                tTotal[k] = tTotal[k] + s['dbg']['proc']['end'] - sl_t
            else:
                tTotal.append(0)
                tTotal[k] = s['dbg']['proc']['end'] - s['dbg']['proc']['start']
                i = 1
            sl = s;   
            sl_t = s['dbg']['proc']['end']
            ii = 1
            x1.append(s['nPRB'])
        except:
            continue
            # print("SLICE -- ", s)
            #print("INDEX -- ", ind)
        ind = ind + 1   
    
    fig, ax = plt.subplots()
    ax.plot(oc2)
    plt.show()
    print(tTotal)
    
    print("Total slices: ", len(slices))
    print("Number of error slices: ", len(err))

for sl in cfgSlices:
    sendCMD(CMD_RMSLICE, sl);

ser.close();




