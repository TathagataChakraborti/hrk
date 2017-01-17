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

ONTABLE_PREFIX = "ontable"
ON_PREFIX = "on "
CLEAR_PREFIX = "clear "
SPL_BLOCK = "red"

class RLAgent(RandomAgent):

    def __init__(self, args):

        RandomAgent.__init__(self, args)

        if not args.boot:

            self.__agentName__ = 'RLAgent'
            self.Q             = Counter()
            
            self.alpha         = args.alpha
            self.gamma         = args.gamma
            self.epsilon       = args.epsilon
        
            
    def getQfunction(self):
        return self.Q

    def setLearningRate(self, value):
        self.alpha   = value

    def setDiscountFactor(self, value):
        self.gamma   = value

    def setRandomExplorationProbability(self, value):
        self.epsilon = value

    def find_highest_tower(self, state):
        # Find base of each tower
        base_list = []
        for pred in state.keys():
            if ONTABLE_PREFIX in pred and state[pred] == 1:
                base_list.append([pred.split(' ')[1].strip(')')])
        curr_height = 0
        #print base_list
        for i in range(len(base_list)):
            curr_block = base_list[i][0]
            stack_explored = False
            while not stack_explored:
                for pred in state.keys():
                    if ON_PREFIX in pred and pred.split(' ')[2] == curr_block and state[pred] == 1:
                        curr_block = pred.split(' ')[1]
                        base_list[i].append(curr_block)
                    if CLEAR_PREFIX + curr_block in pred and state[pred] == 1:
                        stack_explored = True

            if len(base_list[i]) > curr_height:
                curr_height = len(base_list[i])
        return curr_height

    def is_spl_block_free(self, state):
        for pred in state.keys():
            if CLEAR_PREFIX + SPL_BLOCK in pred:
                return True    
        return False

    def convert_state_to_features(self, state):
        # Find the highest tower
        #print state.keys()
        height = self.find_highest_tower(state)
        if self.is_spl_block_free(state):
            block_status = "free"
        else:
            block_status = "blocked"
        #print "feat",str(height) + '@' + block_status

        return str(height) + '@' + block_status


    def __learn__(self, oldState, action, newState, reward, problem_instance):

        new_oldState = copy.deepcopy(oldState)
        new_newState = copy.deepcopy(newState)
        for item in problem_instance.getGoalState().items():
            new_oldState['goal+'+item[0]] = item[1]
            new_newState['goal+'+item[0]] = item[1]
        
        self.Q[self.convert_state_to_features(new_oldState), action] = (1 - self.alpha) * self.Q[self.convert_state_to_features(new_oldState), action]\
                                                + self.alpha * (reward + self.gamma * max([self.Q[self.convert_state_to_features(new_newState), act] for act in problem_instance.getActions(newState)]))
        
    def __getNextAction__(self, problem_instance, state):

        new_state = copy.deepcopy(state)
        for item in problem_instance.getGoalState().items():
            new_state['goal+'+item[0]] = item[1]
        return numpy.random.choice(problem_instance.getActions(state), p = p_norm([self.Q[new_state.freeze(), action] for action in problem_instance.getActions(state)]))\
            if random.random() < self.epsilon and self.__train_flag__\
               else list(problem_instance.getActions(state))[random.choice(numpy.argwhere([self.Q[self.convert_state_to_features(new_state), action] for action in problem_instance.getActions(state)]
                                                                                          == numpy.amax([self.Q[self.convert_state_to_features(new_state), action]
                                                                                                         for action in problem_instance.getActions(state)])).flatten().tolist())]

