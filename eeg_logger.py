#!/usr/bin/env python

'''
Topic   :: Emotiv Epoc+ raw eeg data logger
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 10/07/2016
'''

print "Loading packages..."

import sys,os, random
import ctypes
import threading
import time, datetime

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

'''
Global variables
'''

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

__RECORDING_DATA_ID__ = random.randint(1,9999)
start_animation_flag  = False
online_casting_flag   = False


'''
Method :: data acquisition loop
'''

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

    print "Writing to data\EEG_{}.csv...".format(__RECORDING_DATA_ID__)
        
    out_file = open('{}\EEG_{}.csv'.format('C:\hrk\data', __RECORDING_DATA_ID__), 'w')
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

                    channel_data = []
                    
                    for i in sorted(targetChannelList.keys()):

                        libEDK.IEE_DataGet(hData, i, byref(arr), nSam)
                        print >>out_file, arr[sampleIdx], ",",

                        if i > 2 and i < 17:
                            channel_data.append(str(arr[sampleIdx]))
                        
                    print >>out_file, '\n',
                    print ' '.join(channel_data)
                
        time.sleep(1)

    libEDK.IEE_DataFree(hData)
    libEDK.IEE_EngineDisconnect()
    libEDK.IEE_EmoStateFree(eState)
    libEDK.IEE_EmoEngineEventFree(eEvent)

    

'''
Method :: main
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method for the EEG data logger. ''',
                                     epilog      = '''Usage >> ./emotiv_logger.py -a rain -p 0.99 -d 60''')

    parser.add_argument('-a', '--animation',    type=str,             help="run animation; options - rain, grid, arrow, number, dummy, real")
    parser.add_argument('-p', '--probability',  type=float,           help="probability of oddball (default=0.9)")
    parser.add_argument('-d', '--duration',     type=int,             help="duration of the animation (in seconds, default=10)")
    parser.add_argument('-t', '--testbench',    action='store_true',  help="use Xavier Testbench to record data")
    parser.add_argument('-o', '--online',       action='store_true',  help="run online mode")

    args = parser.parse_args()

    global start_animation_flag
   
    if args.animation:

        if not args.probability: args.probability = 0.9
        if not args.duration:    args.duration    = 10

        if args.testbench:

            terminal_prompt      = raw_input("Start recording on Xavier Testbench >>")
            start_animation_flag = True

        else:
                
            thread_ = threading.Thread(target = data_acquisition_loop, args = [])
            thread_.start()

        while not start_animation_flag:
            pass

        try:

            animation_object = eval(args.animation.capitalize())(__RECORDING_DATA_ID__, args.probability, args.duration)
            animation_object.simulate()

        except:

            raw_input("Press <enter> to stop recording >>")
        
        start_animation_flag = False

    else: parser.print_help()
        

if __name__ == '__main__':
    main()

    
