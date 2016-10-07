#!/usr/bin/env python

'''
Topic   :: Emotiv Epoc+ raw eeg data logger
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

from animations.Animations import *

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


run_animation_flag    = True
start_animation_flag  = False

def data_acquisition_loop():

    libEDK            = cdll.LoadLibrary("./Github_Advanced/bin/x86/edk.dll")
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
    state             = c_int(0)
    input             = ''

    if libEDK.IEE_EngineConnect("Emotiv Systems-5"):
        print "Emotiv Engine start up failed."
        exit()

    with open('EEG.csv', 'w') as clean_file:
        print "Writing to EEG.csv..."
        
    out_file = open('EEG.csv', 'w')
    header   = ['LOG'] + [targetChannelList[key] for key in sorted(targetChannelList.keys())]

    for item in header:
 		print >>out_file, item, ",",

    print >>out_file, '\n'
    
    hData   = libEDK.IEE_DataCreate()
    libEDK.IEE_DataSetBufferSizeInSec(secs)

    check   = raw_input("Press <enter> to begin experiment >>")

    global start_animation_flag
    start_animation_flag = True

    while start_animation_flag:

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
                
                    print >>out_file, datetime.datetime.now().isoformat(), ",",

                    for i in sorted(targetChannelList.keys()):
                    
                        libEDK.IEE_DataGet(hData, i, byref(arr), nSam)
                        print >>out_file, arr[sampleIdx], ",",
                
                    print >>out_file, '\n',
                
        time.sleep(1)
        print start_animation_flag

    libEDK.IEE_DataFree(hData)
    libEDK.IEE_EngineDisconnect()
    libEDK.IEE_EmoStateFree(eState)
    libEDK.IEE_EmoEngineEventFree(eEvent)


thread_ = threading.Thread(target = data_acquisition_loop, args = [])
thread_.start()

while not start_animation_flag:
    pass

animation_object = Grid(probability = 0.9)
animation_object.simulate()
print 666
start_animation_flag = False

'''
main method
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method. EEG logger. ''',
                                     epilog      = '''Usage >> ./emotiv_logger.py -a rain -p 0.99''')

    parser.add_argument('-a', '--animation',    type=str,   help="run animation; options - rain, grid, arrow")
    parser.add_argument('-p', '--probability',  type=float, help="probability of oddball")
    args = parser.parse_args()

    if args.animation:

        animation_object = eval(args.animation.capitalize())(args.probability)
        animation_object.simulate()
        print 666
        
    else: parser.print_help()
        

if __name__ == '__main__':
    main()

    
