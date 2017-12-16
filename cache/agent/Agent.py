#!/usr/bin/env python

'''
Topic   :: basic random agent
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/27/2016
'''

'''
Packages
'''

from utils         import *
from Environment   import BlocksWorld

import os, copy, random, numpy

import cPickle           as pickle
import matplotlib.pyplot as plt


'''
Global variables
'''

'''
Class :: RandomAgent
'''

class RandomAgent:

    def __init__(self, args):

        if args.boot:
            
            with open(args.boot, 'rb') as f:
                self.__dict__ = pickle.load(f).__dict__

        else:
        
            self.__agentName__    = 'RandomAgent'
            self.__agentID__      = random.randint(0,99999)
            self.__epoch_number__ = 0
            
        self.__train_flag__   = args.train
        self.__test_flag__    = args.test
        self.__max_episode__  = args.threshold
        self.__refresh__      = args.refresh
            

    def getName(self):
        return '{}_{}'.format(self.__agentName__, self.__agentID__)
    
    def __update_parameters__(self):
        return

    def train(self, N, replay, simulate_flag = True, bootstrap_flag = False):

        plan_length_list = []
        if self.__refresh__:
            self.fig      = plt.figure()
            self.fig.show()

        for num_replay in range(replay+1):
            for num_epoch in range(N):
                
                self.__epoch_number__ += 1
                self.__update_parameters__()

                goal    = 3#random.randint(2,3)
                plan, u = self.execute(goal, simulate_flag, bootstrap_flag)

                plan_length_list.append(len(plan))
                
                print '{} :: episode = {} replay = {}/{}; goal = {}; plan length = {}; utility = {}'.format(self.getName(), self.__epoch_number__, num_replay, replay, goal, len(plan), u)

                if not self.__epoch_number__ % self.__refresh__: self.plot(plan_length_list)

                
    def execute(self, goal, simulate_flag = True, bootstrap_flag = False):

        blocksworld_instance = BlocksWorld(goal)
        newState             = blocksworld_instance.getCurrentState()
        plan                 = []
        utility              = 0
        
        while not blocksworld_instance.isGoal(newState):

            nextAction                         = self.__getNextAction__(blocksworld_instance, newState)
            oldState, action, newState, reward = blocksworld_instance.observeTransition(newState, nextAction, simulate_flag, bootstrap_flag)

            plan.append(action)
            utility += reward
            
            #if not self.__train_flag__ and not self.__test_flag__: print '>>', action, reward
            
            if self.__train_flag__ or bootstrap_flag:
                self.__learn__(oldState, action, newState, reward, blocksworld_instance)
                
            if len(plan) >= self.__max_episode__: break
            
        blocksworld_instance.cleanup()            
        return plan, utility

    def __getNextAction__(self, problem_instance, state):
        return random.choice(list(problem_instance.getActions(state)))
    
    def __learn__(self, oldState, action, newState, reward, goal):
        raise NotImplementedError('This is not a learning agent.')

    def save(self):
        fileName = '{}.p'.format(self.getName())
        os.system('rm -f {}'.format(fileName))
        pickle.dump(self, open(fileName, 'wb'))

        
    def showQ(self):

        qq = [item[1] for item in self.getQfunction().items()]

        q_pos  = [item[1] if item[1] > 0 else 0 for item in self.getQfunction().items()]
        q_neg  = [item[1] if item[1] < 0 else 0 for item in self.getQfunction().items()]

        fig = plt.figure()

        q_zero = [max(qq) if item[1] == 0 else 0 for item in self.getQfunction().items()]
        line1, = plt.plot(range(len(qq)), q_zero, color='red')

        q_zero = [min(qq) if item[1] == 0 else 0 for item in self.getQfunction().items()]
        line2, = plt.plot(range(len(qq)), q_zero, color='red')

        line3, = plt.plot(range(len(qq)), qq, color='blue')
        line4, = plt.plot(range(len(qq)), q_neg, color='green')

        ax = fig.add_subplot(111)
        ax.set_xlim([0, len(qq)])
        ax.set_ylim([min(qq), max(qq)])
        ax.set_xlabel('states -->')
        ax.set_ylabel('value of Q function -->')
        plt.legend([line1, line3, line4], ['positive Q value', 'negative Q value', 'unexplored'])

        fig.show()

        
    def plot(self, plan_length_list):

        plt.cla()

        line1, = plt.plot(plan_length_list, color='red')
        line2, = plt.plot([numpy.mean(plan_length_list) for item in plan_length_list], 'b--', linewidth=2)

        errorList                    = numpy.convolve(plan_length_list, numpy.ones(self.__refresh__)/self.__refresh__)
        errorList[:self.__refresh__] = [float(sum(plan_length_list[:idx+1]))/(idx+1) for idx in range(self.__refresh__)]
        errorList                    = errorList[:-self.__refresh__+1]

        line3, = plt.plot(errorList, color='blue', linewidth=3)
        
        ax = self.fig.add_subplot(111)

        ax.set_xlabel('n-th episode -->')
        ax.set_title('learning progress -->')
        ax.set_ylim([0, self.__max_episode__+10])
        
        plt.legend([line1, line2, line3], ['length of episode', 'mean episode length', 'moving average of episode lengths'])
        
        self.fig.canvas.draw()
