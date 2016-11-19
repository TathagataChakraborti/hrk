#!/usr/bin/env python

'''
Topic   :: raw eeg classifier
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/19/2016
'''

'''
Packages
'''

print "Loading packages..."

import argparse
import sys,os, random

from sklearn import svm


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

'''
Method :: train SVM
'''

def train_SVM(x_train, y_train):

    clf = svm.SVC()
    clf.fit(x_train, y_train)

    return clf


'''
Method :: classify
'''

def classify(x, clf):
    return clf.predict(x)

    
'''
Method :: compute classification error
'''

def classification_error(x, y, clf_model):
    return 100*float(sum([int(classify(x[idx], clf_model) != y[idx]) for idx in range(len(y))]))/len(y)
    
'''
Method :: read csv file with raw eeg data
'''

def read_csv(fileName):
    pass


'''
Method :: extract AAR(p) parameters
'''

def extract_aarp(data, p = 9):
    pass
    

'''
Method :: main
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method for EEG data classification. ''',
                                     epilog      = '''Usage >> ./eeg_classify.py -f <filename>''')

    parser.add_argument('-f', '--filename',   type=str,                       help="File with raw eeg data.")
    parser.add_argument('-s', '--test_split', type=float,          default=0, help="Percentage of data used for testing.")
    parser.add_argument('-o', '--online',     action='store_true',            help="Run online mode.")

    args = parser.parse_args()

    if args.filename:

        data = read_csv(args.filename)
        x, y = extract_aarp(data)

        x_train, y_train = x[:int(args.s*len(x)/100)], y[:int(args.s*len(x)/100)]
        x_test,  y_test  = x[int(args.s*len(x)/100):], y[int(args.s*len(x)/100):]

        clf_model        = train_SVM(x_train, y_train)

        print 'Training complete.\nError on training data :: {}%'.format(classification_error(x_train, y_train, clf_model))
        if x_test: print 'Error on test data :: {}%'.format(classification_error(x_test, y_test, clf_model))
        
    else: parser.print_help()
        

if __name__ == '__main__':
    main()

    
