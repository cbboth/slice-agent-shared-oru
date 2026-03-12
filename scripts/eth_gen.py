# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

ETH_P_ALL = 0x0003
from scapy.all import *

if __name__ == "__main__":
    IFACES.show()
    interface = IFACES.dev_from_index(18)
    
    print("Start sending")
    filename = 'arp_data.dat'
    with open(filename, 'r') as file:
        hexlist = [int(x, 16) for x in file.read().split()]
    packet = bytearray(hexlist)
    sendp(packet, iface=interface)
    #socket.senpd(packet). # send raw data
      
    print("Sent packet of length %d bytes" % 0)