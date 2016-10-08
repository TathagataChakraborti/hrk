#!/usr/bin/env python

'''
Topic   :: Animation Classes
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 10/07/2016
'''

print "Loading animation ..."

import sys, os, time, datetime
import random, argparse, threading

import numpy             as np
import matplotlib.pyplot as plt

from   matplotlib.animation import FuncAnimation
from   matplotlib           import colors


'''
Global variables
'''

_PACKAGE_PATH     = 'C:/hrk/animations/cache'
_SAVE_DATA_PATH   = 'C:\hrk\data'
_PORT_WRITER_PATH = 'C:\hrk'

_PORT_NAME        = 'COM9'

_START_MARKER     = 3
_POSITIVE_MARKER  = 1
_NEGATIVE_MARKER  = 2
_END_MARKER       = 4


'''
Class :: basic animation class
'''

class Animation:

    def __init__(self, data_id, probability, duration):

        self.data_id      = data_id
        self.log_file     = '{}\log_{}.dat'.format(_SAVE_DATA_PATH, self.data_id)
        
        self.probability  = probability
        self.duration     = duration

    def __set_parameters__(self, interval = 1000):

        self.interval     = interval
        self.frames       = self.duration*1000/self.interval
        self.probability += 0.1 * (1 - self.interval / 1000.0)

        self.__log__(_START_MARKER)

    def getName(self):
        return self.__class__.__name__

    def simulate(self):
        self.animation = FuncAnimation(self.fig, self.__render__, interval=self.interval, frames=self.frames, repeat=False)
        plt.show()

    def __render__(self, frame_number):
        raise NotImplementedError()

    def __log__(self, marker_id):
        os.system('{}\PortWrite.exe {} {}'.format(_PORT_WRITER_PATH, _PORT_NAME, marker_id))
        os.system('echo {} {} >> {}'.format(datetime.datetime.now().isoformat(), marker_id, self.log_file))

    
'''
Class :: Dummy prints 1/666
'''

class Dummy(Animation):

    def __init__(self, data_id, probability, duration):
        Animation.__init__(self, data_id, probability, duration)
        self.__set_parameters__()
        
    def simulate(self):

        frame_number = 0

        while frame_number < self.frames:

            self.__render__(frame_number)

            time.sleep(self.interval/1000.0)

            if frame_number == self.frames - 1:
                self.__log__(_END_MARKER)
            
            frame_number += 1

            
    def __render__(self, frame_number):

        if random.random() > self.probability:

            print "Dummy - 666"
            self.__log__(_POSITIVE_MARKER)

        else:

            print "Dummy - 1"
            self.__log__(_NEGATIVE_MARKER)
            
        
'''
Class  :: rain + thunder/blood!
Source :: adopted from matplotlib rain animation by Nicolas P. Rougier
'''

class Rain(Animation):
    
    def __init__(self, data_id, probability, duration):
        
        Animation.__init__(self, data_id, probability, duration)

        self.freeze_flag = False

        self.fig         = plt.figure(figsize=(8,8))
        ax               = self.fig.add_axes([0, 0, 1, 1], frameon=False)

        self.n_drops     = 20
        self.rain_drops  = np.zeros(self.n_drops, dtype=[('position', float, 2),
                                                         ('size',      float, 1),
                                                         ('growth',    float, 1),
                                                         ('color',     float, 4)])

        self.rain_drops['position'] = np.random.uniform(0, 1, (self.n_drops, 2))
        self.rain_drops['growth']   = np.random.uniform(50, 200, self.n_drops)

        self.scat        = ax.scatter(self.rain_drops['position'][:,0], self.rain_drops['position'][:,1],
                                      s=self.rain_drops['size'], lw=0.5, edgecolors=self.rain_drops['color'],
                                      facecolors='none')
        
        self.__set_parameters__(100)

          
    def __render__(self, frame_number):

        if self.freeze_flag:
            time.sleep(0.5)
            self.freeze_flag = False
        
        current_index                   = frame_number % self.n_drops

        self.rain_drops['color'][:, 3] -= 1.0/len(self.rain_drops)
        self.rain_drops['color'][:,3]   = np.clip(self.rain_drops['color'][:,3], 0, 1)

        self.rain_drops['size']        += self.rain_drops['growth']
    
        self.rain_drops['position'][current_index] = np.random.uniform(0, 1, 2)
        self.rain_drops['size'][current_index]     = 5
        self.rain_drops['color'][current_index]    = (0, 0, 0, 1)
        self.rain_drops['growth'][current_index]   = np.random.uniform(50, 200)

        self.scat.set_edgecolors(self.rain_drops['color'])
        self.scat.set_sizes(self.rain_drops['size'])
        self.scat.set_offsets(self.rain_drops['position'])
        
        if random.random() > self.probability:

            self.fig.patch.set_facecolor('white')
            self.scat.set_facecolors('red')
            self.freeze_flag = True

            self.__log__(_POSITIVE_MARKER)

        else:

            self.fig.patch.set_facecolor('gray')
            self.scat.set_facecolors('none')

            self.__log__(_NEGATIVE_MARKER)
            
        if frame_number == self.frames - 1:
            self.__log__(_END_MARKER)
            self.fig.patch.set_facecolor('black')
        
            
'''
Class :: grid + random flashes
'''

class Grid(Animation):

    def __init__(self, data_id, probability, duration):

        Animation.__init__(self, data_id, probability, duration)        

        self.fig  = plt.figure(figsize=(8,8))
        self.__set_parameters__()
        
        
    def __render__(self, frame_number):

        zvals  = np.random.rand(8,8)*10-5

        if random.random() > self.probability: 

            cmap = colors.ListedColormap(['red', 'white', 'black'])
            self.__log__(_POSITIVE_MARKER)

        else:

            cmap = colors.ListedColormap(['white', 'black', 'red'])
            self.__log__(_NEGATIVE_MARKER)
        
        bounds = [0,0,8,8]
        norm   = colors.BoundaryNorm(bounds, cmap.N)

        img    = plt.imshow(zvals, interpolation='nearest', cmap=cmap, norm=norm)

        if frame_number == self.frames - 1:
            self.__log__(_END_MARKER)
            self.fig.patch.set_facecolor('black')

            
'''
Class :: random directions
'''

class Arrow(Animation):

    def __init__(self, data_id, probability, duration):

        Animation.__init__(self, data_id, probability, duration)

        self.freeze_flag = False
        
        self.img_up      = plt.imread('{}/arrows/up.png'.format(_PACKAGE_PATH))
        self.img_down    = plt.imread('{}/arrows/down.png'.format(_PACKAGE_PATH))
        self.img_left    = plt.imread('{}/arrows/left.png'.format(_PACKAGE_PATH))
        self.img_right   = plt.imread('{}/arrows/right.png'.format(_PACKAGE_PATH))

        self.fig         = plt.figure(figsize=(8,8))

        self.fig.patch.set_facecolor('white')
        self.__set_parameters__()
        
        
    def __render__(self, frame_number):

        if self.freeze_flag:
            time.sleep(0.5)
            self.freeze_flag = False

        if random.random() > self.probability:

            plt.axis('off')

            img = random.choice([self.img_up, self.img_down, self.img_left, self.img_right])
            img = plt.imshow(img)
            
            self.__log__(_POSITIVE_MARKER)
            
            self.freeze_flag = True
            
        else:
            
            plt.clf()
            self.__log__(_NEGATIVE_MARKER)

        if frame_number == self.frames - 1:
            self.__log__(_END_MARKER)
            self.fig.patch.set_facecolor('black')
        
            
class Number(Animation):

    def __init__(self, data_id, probability, duration):

        Animation.__init__(self, data_id, probability, duration)

        self.images = []
        for i in range(1,10):
            self.images.append(plt.imread('{}/numbers/{}.png'.format(_PACKAGE_PATH, i)))

        self.number    = 2
        self.fig       = plt.figure(figsize=(8,8))

        self.fig.patch.set_facecolor('white')
        self.__set_parameters__()
        
        
    def __render__(self, frame_number):
        
        plt.clf()
        plt.axis('off')

        if random.random() > self.probability:

            img = self.images[self.number-1]
            self.__log__(_POSITIVE_MARKER)
            
        else:

            img = random.choice(self.images)
            self.__log__(_NEGATIVE_MARKER)

        img = plt.imshow(img, cmap=plt.cm.Reds_r)

        time.sleep(1)

        if frame_number == self.frames - 1:
            self.__log__(_END_MARKER)
            self.fig.patch.set_facecolor('black')
        
            
'''
main method
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method. Interface to animation classes''',
                                     epilog      = '''Usage >> ./main.py -a rain -p 0.99''')


    parser.add_argument('-a', '--animation',    type=str,             help="run animation; options - rain, grid, arrow, number, dummy")
    parser.add_argument('-p', '--probability',  type=float,           help="probability of oddball (default=0.9)")
    parser.add_argument('-d', '--duration',     type=int,             help="duration of the animation (in seconds, default=60)")

    args = parser.parse_args()

    if args.animation:

        if not args.probability: args.probability = 0.9
        if not args.duration:    args.duration    = 10

        animation_object = eval(args.animation.capitalize())(0, args.probability, args.duration)
        animation_object.simulate()
        
    else: parser.print_help()
        

if __name__ == '__main__':
    main()

    
