#!/usr/bin/env python

'''
Topic   :: reinforcement learning agent
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/27/2016
'''

'''
Packages
'''

import random, numpy, copy

from Agent import RandomAgent
from utils import *

'''
Class :: RLAgent
'''

class RLAgent(RandomAgent):

    def __init__(self, args):

        RandomAgent.__init__(self, args)

        if not args.boot:

            self.__agentName__ = 'RLAgent'
    
            self.alpha         = args.alpha
            self.gamma         = args.gamma
            self.epsilon       = args.epsilon
        
            self.Q             = Counter()
            
    def getQfunction(self):
        return self.Q

    def setLearningRate(self, value):
        self.alpha   = value

    def setDiscountFactor(self, value):
        self.gamma   = value

    def setRandomExplorationProbability(self, value):
        self.epsilon = value
        
    def __learn__(self, oldState, action, newState, reward, problem_instance):

        new_oldState = copy.deepcopy(oldState)
        new_newState = copy.deepcopy(newState)
        for item in problem_instance.getGoalState().items():
            new_oldState['goal+'+item[0]] = item[1]
            new_newState['goal+'+item[0]] = item[1]
        
        self.Q[new_oldState.freeze(), action] = (1 - self.alpha) * self.Q[new_oldState.freeze(), action]\
                                                + self.alpha * (reward + self.gamma * max([self.Q[new_newState.freeze(), act] for act in problem_instance.getActions(newState)]))
        
    def __getNextAction__(self, problem_instance, state):

        new_state = copy.deepcopy(state)
        for item in problem_instance.getGoalState().items():
            new_state['goal+'+item[0]] = item[1]

            return numpy.random.choice(problem_instance.getActions(state), p = p_norm([self.Q[new_state.freeze(), action] for action in problem_instance.getActions(state)]))\
            if random.random() < self.epsilon and self.__train_flag__\
               else list(problem_instance.getActions(state))[random.choice(numpy.argwhere([self.Q[new_state.freeze(), action] for action in problem_instance.getActions(state)]
                                                                                          == numpy.amax([self.Q[new_state.freeze(), action]
                                                                                                         for action in problem_instance.getActions(state)])).flatten().tolist())]

