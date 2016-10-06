#!/usr/bin/env python

'''
Topic   :: EEG Epoc+ data logger
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 09/29/2016
'''

print "Loading..."

import datetime
import sys,os
import time
import ctypes
import threading

from ctypes import cdll
from ctypes import CDLL
from ctypes import c_int
from ctypes import c_uint
from ctypes import pointer
from ctypes import c_char_p
from ctypes import c_float
from ctypes import c_double
from ctypes import byref

targetChannelList = { 0  : 'COUNTER',
                      1  : 'INTERPOLATED',
                      2  : 'RAW_CQ', 
                      3  : 'AF3',
                      4  : 'F7', 
                      5  : 'F3',
                      6  : 'FC5',
                      7  : 'T7', 
                      8  : 'P7',  
                      9  : 'O1',  
                      10 : 'O2',  
                      11 : 'P8',  
                      12 : 'T8',  
                      13 : 'FC6', 
                      14 : 'F4',  
                      15 : 'F8',  
                      16 : 'AF4', 
                      19 : 'TIMESTAMP',
                      20 : 'ES_TIMESTAMP',
                      21 : 'FUNC_ID',
                      22 : 'FUNC_VALUE',
                      23 : 'MARKER',
                      24 : 'SYNC_SIGNAL' }

libEDK            = cdll.LoadLibrary("./Github_Advanced/bin/x64/edk.dll")
write             = sys.stdout.write
eEvent            = libEDK.IEE_EmoEngineEventCreate()
eState            = libEDK.IEE_EmoStateCreate()
userID            = c_uint(0)
nSamples          = c_uint(0)
nSam              = c_uint(0)
nSamplesTaken     = pointer(nSamples)
data              = pointer(c_double(0))
user              = pointer(userID)
composerPort      = c_uint(1726)
secs              = c_float(1)
datarate          = c_uint(0)
readytocollect    = False
option            = c_int(0)
state             = c_int(0)

input             = ''
option            = int(raw_input("Press '1' to start collecting data >> "))

if libEDK.IEE_EngineConnect("Emotiv Systems-5"):
    print "Emotiv Engine start up failed."
    exit()

os.system('rm -f ./data/EEG.csv')
    
print "Writing to ./data/EEG.csv..."
f = open('./data/EEG.csv', 'w')
print >> f, ['LOG'] + [targetChannelList[key] for key in sorted(targetChannelList.keys())]
    
hData   = libEDK.IEE_DataCreate()
libEDK.IEE_DataSetBufferSizeInSec(secs)

while True:

    state = libEDK.IEE_EngineGetNextEvent(eEvent)

    if not state:

        eventType = libEDK.IEE_EmoEngineEventGetType(eEvent)
        libEDK.IEE_EmoEngineEventGetUserId(eEvent, user)
        
        if eventType == 16:
            print "User added"
            libEDK.IEE_DataAcquisitionEnable(userID,True)
            readytocollect = True

                
    if readytocollect:    
            
        libEDK.IEE_DataUpdateHandle(0, hData)
        libEDK.IEE_DataGetNumberOfSample(hData,nSamplesTaken)
        print "Updated :", nSamplesTaken[0]

        if nSamplesTaken[0]:

            nSam=nSamplesTaken[0]
            arr=(ctypes.c_double*nSamplesTaken[0])()
            ctypes.cast(arr, ctypes.POINTER(ctypes.c_double))
            
            for sampleIdx in range(nSamplesTaken[0]): 
                
                print >>f, datetime.datetime.now().isoformat(), ",",

                for i in sorted(targetChannelList.keys()):
                    
                    libEDK.IEE_DataGet(hData, i, byref(arr), nSam)
                    print >>f, arr[sampleIdx], ",",
                
                print >>f,'\n'
                
    time.sleep(1)

libEDK.IEE_DataFree(hData)

#---------------------------------------------------------------------------------------------------------------------------------------------------------------
libEDK.IEE_EngineDisconnect()
libEDK.IEE_EmoStateFree(eState)
libEDK.IEE_EmoEngineEventFree(eEvent)
