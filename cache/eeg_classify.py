#!/usr/bin/env python

'''
Topic   :: raw eeg classifier
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/21/2016
'''

'''
Packages
'''

print "Loading packages..."

import argparse, csv, copy
import numpy as np

from sklearn import svm
from sklearn.decomposition import PCA
from scipy.signal import butter, lfilter

'''
Global variables
'''
_samples  = 100
_channels = 14

_headers  = { 2  : 'AF3',
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
Method :: classify single data point
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
        target    = 0

        for row in reader:

            try:

                marker    = int(float(row[19]))
                read_flag = read_flag or marker == 3
                read_flag = read_flag and not marker == 4

                if read_flag:

                    samples.append([float(item) for item in row[2:16]])
                    
                    if marker != 0:

                        if target:

                            data.append([samples[:_samples], target])
                            samples = []
                            
                        target  = marker

            except:pass

    return data
    

'''
Method :: butterworth bandpass filter
'''

def make_my_filter(data, lowcut = 0.1, highcut = 100, fs = 128, order = 4):

    nyq  = 0.5 * fs
    low  = lowcut / nyq
    high = highcut / nyq

    b, a = butter(order, [low, high], btype='band')
    y    = lfilter(b, a, data)

    return y


'''
Method :: normalize array
'''

def normalize(data, type = 1):

    if type == 1:
        
        mean = sum(data)/len(data)
        dev  = sum([pow(item, 2) for item in data])/pow(len(data), 2) - pow(mean, 2)
        
        data = [(item-mean)/dev for item in data]

    elif type == 2:

        dmin = min(data)
        dmax = max(data)
        data = [2*(item-(dmax+dmin)/2)/(dmax-dmin) for item in data]

    else:pass
        
    return data


'''
Class :: AAR(p)
'''

class AAR:

    def __init__(self, p = 9, UC = 0.007):

        self.p  = p
        self.UC = UC
        self.c  = _channels

        self.l  = 1/float(1- self.UC)
        
        self.E  = 0 
        self.Y  = np.zeros(self.p) 
        self.a  = np.zeros(self.p)
        
        self.A  = 0.1 * np.identity(self.p)
        self.r  = np.zeros(self.p)
        self.k  = np.zeros(self.p)

        
    def getparams(self):
        return list(self.a)

    
    def update(self, y):

        self.E  = y - np.dot(self.a, self.Y)
        self.r  = self.l * np.matmul(self.A, self.Y)
        self.k  = self.r / (1 + np.dot(self.Y, self.r))
        self.a  = self.a + self.k * self.E
        self.A  = self.l * self.A - self.k.reshape(-1,1) * self.r

        for idx in range(self.p-1):
            self.Y[idx] = self.Y[idx+1]
        self.Y[-1]      = y


'''
Method :: extract raw features
'''
        
def extract_raw_features(data, do_PCA = False, do_normalize = False):

    data = data[1:]
    x    = np.zeros([len(data), _channels])
    y    = []

    for idx in range(len(data)):
        item   = data[idx]
        x[idx] = [sum([entry[i] for entry in item[0]])/len(item[0]) for i in range(_channels)]
        y.append(item[1])
    
    if do_PCA:

        pca = PCA(n_components=20, svd_solver='full')
        pca.fit(x)
        x   = pca.transform(x)

    else:

        pca = None

    if do_normalize:
        pass

    print 'Created dataset...\nNumber of oddballs - {}/{}'.format(sum([int(item == 1) for item in y]), len(y))
    return x, y


'''
Method :: extract AAR(p) features
'''
        
def extract_aar_features(data, p, uc, AAR_dict = None, do_PCA = False, do_normalize = False):

    if not AAR_dict:
        AAR_dict = {key : AAR(p, uc) for key in range(_channels)}

    x = np.zeros([len(data)-1, p * _channels * _samples])
    y = []
        
    for idd in range(len(data)):

        item   = data[idd]
        x_aarp = []

        for sample in item[0]:

            params = []
            for idx in range(_channels):

                AAR_dict[idx].update(sample[idx])
                params += AAR_dict[idx].getparams()

            x_aarp += params

        if item[1] != 3:

            x[idd-1]  = x_aarp
            y.append(item[1])

            x_aarp = []

    if do_PCA:

        pca = PCA(n_components=20, svd_solver='full')
        pca.fit(x)
        x   = pca.transform(x)

    else:

        pca = None

    if do_normalize:
        pass

    print 'Created dataset...\nNumber of oddballs - {}/{}'.format(sum([int(item == 1) for item in y]), len(y))
    return x, y, AAR_dict, pca


'''
Method :: main
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method for EEG data classification. ''',
                                     epilog      = '''Usage >> ./eeg_classify.py -f <filename>''')

    parser.add_argument('-f', '--filename',            type=str,                   help="File with raw eeg data.")
    parser.add_argument('-t', '--test_filename',       type=str,                   help="File with test data.")
    parser.add_argument('-v', '--val_split',           type=float, default=90,     help="Percentage of data used for training; default s = 90.")

    parser.add_argument('-z', '--feat',                type=str,                   help="Model for feature extraction; options are aar (default) and raw.")

    parser.add_argument('-p', '--order_of_aar',        type=int,   default=9,      help="Order of AAR model; default p = 9.")
    parser.add_argument('-u', '--update_coefficient',  type=float, default=0.007,  help="Update Coefficient; default UC = 0.007.")

    parser.add_argument('-r', '--do_pca',              action='store_true',        help="Do principal component analysis.")
    parser.add_argument('-n', '--do_normalize',        action='store_true',        help="Normalize data.")

    parser.add_argument('-o', '--online',              action='store_true',        help="Run online mode.")

    args = parser.parse_args()

    if args.filename:

        data             = read_csv(args.filename)

        if    args.feat == 'aar':  x, y, aarp, pca  = extract_aar_features(data, args.order_of_aar, args.update_coefficient, do_PCA = args.do_pca, do_normalize = args.do_normalize)
        elif  args.feat == 'raw':  x, y             = extract_raw_features(data, do_PCA = args.do_pca, do_normalize = args.do_normalize)
        else:                      raise RuntimeError("Specify feature extraction model")
            
        s                = int(args.val_split*len(x)/100)
        x_train, y_train = x[:s,:], y[:s]
        x_val,   y_val   = x[s:,:], y[s:]

        print "Training..."
        
        clf_model        = train_SVM(x_train, y_train)

        print 'Training complete.\nTraining error :: {}%'.format(classification_error(x_train, y_train, clf_model))

        if x_val.shape:

            print 'Validation error :: {}%'.format(classification_error(x_val, y_val, clf_model))
            confusion_matrix(x_val, y_val, clf_model)

        if args.test_filename:

            data            = read_csv(args.test_filename)

            if   args.feat == 'aar':  x, y, aarp, pca  = extract_aar_features(data, args.order_of_aar, args.update_coefficient, do_PCA = args.do_pca, do_normalize = args.do_normalize)
            elif args.feat == 'raw':  x, y             = extract_raw_features(data, do_PCA = args.do_pca, do_normalize = args.do_normalize)
            else:                     raise RuntimeError("Specify feature extraction model")

            print 'Test error :: {}%'.format(classification_error(x, y, clf_model))            
            confusion_matrix(x, y, clf_model)
            
    else:parser.print_help()
        

if __name__ == '__main__':
    main()

    
