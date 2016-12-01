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

import os, copy, random
import cPickle as pickle

'''
Global variables
'''

'''
Class :: RandomAgent
'''

class RandomAgent:

    def __init__(self, args):

        if args.boot:
            
            with open(reboot_file, 'rb') as f:
                self.__dict__ = pickle.load(f).__dict__

        else:
        
            self.__agentName__    = 'RandomAgent'
            self.__agentID__      = random.randint(0,99999)
            
            self.__train_flag__   = args.train
            self.__test_flag__    = args.test
            self.__max_episode__  = args.threshold
            
            self.__epoch_number__ = 0

            
    def getName(self):
        return '{}_{}'.format(self.__agentName__, self.__agentID__)
    
    def __update_parameters__(self):
        return

    def train(self, N, replay, simulate_flag):

        for num_replay in range(replay+1):
            for num_epoch in range(N):

                self.__epoch_number__ += 1
                self.__update_parameters__()

                goal    = random.randint(2,3)
                plan, u = self.execute(goal, simulate_flag)
                
                print '{} :: replay = {}/{}; goal = {}; plan length = {}; utility = {}'.format(self.getName(), num_replay, replay, goal, len(plan), u)

                
    def execute(self, goal, simulate_flag):

        blocksworld_instance = BlocksWorld(goal)
        newState             = blocksworld_instance.getCurrentState()
        plan                 = []
        utility              = 0
        
        while not blocksworld_instance.isGoal(newState):

            nextAction                         = self.__getNextAction__(blocksworld_instance, newState)
            oldState, action, newState, reward = blocksworld_instance.observeTransition(newState, nextAction)

            plan.append(action)
            utility += reward
            
            if not self.__train_flag__ and not self.__test_flag__: print '>>', action, reward

            if self.__train_flag__:
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
