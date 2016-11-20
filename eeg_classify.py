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

import argparse, csv
import sys,os, random
import numpy as np

from sklearn import svm


'''
Global variables
'''

headers = { 2  : 'AF3',
            3  : 'F7', 
            4  : 'F3',
            5  : 'FC5',
            6  : 'T7', 
            7  : 'P7',  
            8  : 'O1',  
            9  : 'O2',  
            10 : 'P8',  
            11 : 'T8',  
            12 : 'FC6', 
            13 : 'F4',  
            14 : 'F8',  
            15 : 'AF4', 
            19 : 'MARKER'}

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
    return clf.predict(np.array(x).reshape(1,-1))


'''
Method :: draw confusion matrix
'''

def confusion_matrix(x, y, clf_model):

    y_star = [classify(x[idx], clf_model) for idx in range(len(y))]

    print '    ---predicted--'
    print '   |   | N  | Y'
    print ' r | -------------'
    print ' e | N | {} | {}'.format(sum([int(y[idx] == 2 and y_star[idx] == 2) for idx in range(len(y))]), sum([int(y[idx] == 2 and y_star[idx] == 1) for idx in range(len(y))]))
    print ' a | -------------'
    print ' l | Y | {} | {}'.format(sum([int(y[idx] == 1 and y_star[idx] == 2) for idx in range(len(y))]), sum([int(y[idx] == 1 and y_star[idx] == 1) for idx in range(len(y))]))
    
    
'''
Method :: compute classification error
'''

def classification_error(x, y, clf_model):
    return 100*float(sum([int(classify(x[idx], clf_model) != y[idx]) for idx in range(len(y))]))/len(y)
    
'''
Method :: read csv file with raw eeg data
'''

def read_csv(fileName):

    with open(fileName, 'r') as csv_file:

        reader    = csv.reader(csv_file)
        read_flag = False
        data      = []
        samples   = []

        for row in reader:

            try:

                marker    = int(float(row[19]))
                read_flag = read_flag and not marker == 4

                if read_flag:

                    samples.append([float(item) for item in row[2:16]])
                    
                    if marker != 0:

                        data.append([[sum([item[idx] for item in samples])/len(samples) for idx in range(len(samples[0]))], marker])
                        samples = []

                read_flag = read_flag or marker == 3

            except:pass

        return data

    
'''
Method :: extract AAR(p) parameters
'''

def extract_aarp(data, p = 9):

    x = [item[0] for item in data]
    y = [item[1] for item in data]

    print 'Created dataset...\nNumber of oddballs - {}/{}'.format(sum([int(item == 1) for item in y]), len(y))
    return x, y
    

'''
Method :: main
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method for EEG data classification. ''',
                                     epilog      = '''Usage >> ./eeg_classify.py -f <filename>''')

    parser.add_argument('-f', '--filename',       type=str,                help="File with raw eeg data.")
    parser.add_argument('-t', '--test_filename',  type=str,                help="File with test data.")
    parser.add_argument('-v', '--val_split',      type=float, default=90,  help="Percentage of data used for training; default s = 90.")
    parser.add_argument('-o', '--online',         action='store_true',     help="Run online mode.")

    args = parser.parse_args()

    if args.filename:

        data = read_csv(args.filename)
        x, y = extract_aarp(data)

        x_train, y_train = x[:int(args.val_split*len(x)/100)], y[:int(args.val_split*len(x)/100)]
        x_val,   y_val   = x[int(args.val_split*len(x)/100):], y[int(args.val_split*len(x)/100):]

        print "Training..."
        
        clf_model        = train_SVM(x_train, y_train)

        print 'Training complete.\nTraining error :: {}%'.format(classification_error(x_train, y_train, clf_model))
        if x_val: print 'Validation error :: {}%'.format(classification_error(x_val, y_val, clf_model))
        
        if args.test_filename:

            data = read_csv(args.test_filename)
            x, y = extract_aarp(data)
            print 'Test error :: {}%'.format(classification_error(x, y, clf_model))            
            confusion_matrix(x, y, clf_model)
            
    else:parser.print_help()
        

if __name__ == '__main__':
    main()

    
