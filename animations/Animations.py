#!/usr/bin/env python

'''
Topic   :: Animation Classes
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 09/29/2016
'''

import sys, os, time, datetime
import random, argparse

import numpy             as np
import matplotlib.pyplot as plt

from   matplotlib.animation import FuncAnimation
from   matplotlib           import colors


'''
Class :: basic animation class
'''

class Animation:

    def __init__(self, probability):
        self.probability = probability
        
    def getName(self):
        return self.__class__.__name__

    def simulate(self, id = 0):
        self._data_id = id
        animation     = FuncAnimation(self.fig, self.__render__, interval=10, save_count=10)
        plt.show()

    def __render__(self):
        raise NotImplementedError()

    def __log__(self):
        os.system('echo {} >> ./data/log_{}.dat'.format(datetime.datetime.now().isoformat(), self._data_id))

    
'''
Class  :: rain + thunder/blood!
Source :: adopted from matplotlib rain animation by Nicolas P. Rougier
'''

class Rain(Animation):
    
    def __init__(self, probability):
        
        Animation.__init__(self, probability)

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
        

        
    def __render__(self, frame_number):

        if frame_number > 10:
            exit()

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

            self.__log__()

        else:

            self.fig.patch.set_facecolor('gray')
            self.scat.set_facecolors('none')

        
'''
Class :: grid + random flashes
'''

class Grid(Animation):

    def __init__(self, probability = 0.9):

        Animation.__init__(self, probability)        

        self.fig  = plt.figure(figsize=(8,8))
        
        
    def __render__(self, frame_number):

        zvals  = np.random.rand(8,8)*10-5

        if random.random() < self.probability: cmap = colors.ListedColormap(['white', 'black', 'red'])
        else:

            cmap = colors.ListedColormap(['red', 'white', 'black'])
            self.__log__()
        
        bounds = [0,0,8,8]
        norm   = colors.BoundaryNorm(bounds, cmap.N)

        img    = plt.imshow(zvals,interpolation='nearest', cmap = cmap,norm=norm)

        time.sleep(1)

        
'''
Class :: random directions
'''

class Arrow(Animation):

    def __init__(self, probability = 0.9):

        Animation.__init__(self, probability)

        self.img_up    = plt.imread('cache/arrows/up.png')
        self.img_down  = plt.imread('cache/arrows/down.png')
        self.img_left  = plt.imread('cache/arrows/left.png')
        self.img_right = plt.imread('cache/arrows/right.png')

        self.fig       = plt.figure(figsize=(8,8))

        self.fig.patch.set_facecolor('white')
        
        
    def __render__(self, frame_number):

        if random.random() > self.probability:

            plt.axis('off')
            img = random.choice([self.img_up, self.img_down, self.img_left, self.img_right])
            img = plt.imshow(img)

            self.__log__()
            
        else:

            plt.clf()

        time.sleep(1)
        
            
'''
main method
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method. Interface to animation classes''',
                                     epilog      = '''Usage >> ./main.py -a rain -p 0.99''')

    parser.add_argument('-a', '--animation',    type=str,   help="run animation; options - rain, grid, arrow")
    parser.add_argument('-p', '--probability',  type=float, help="probability of oddball")
    args = parser.parse_args()

    if args.animation:

        animation_object = eval(args.animation.capitalize())(args.probability)
        animation_object.simulate()
        
    else: parser.print_help()
        

if __name__ == '__main__':
    main()

    
