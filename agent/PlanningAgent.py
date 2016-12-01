#!/usr/bin/env python

'''
Topic   :: planning agent
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/27/2016
'''

'''
Packages
'''

from Agent import RandomAgent


'''
Class :: PlanningAgent
'''

class PlanningAgent(RandomAgent):

    def __init__(self, args):

        RandomAgent.__init__(self, args)
        self.__agentName__  = 'PlanningAgent'
            

    def __getNextAction__(self, problem_instance, state):

        problem_instance.setState(state)
        plan, cost  = problem_instance.getPlan()
        return plan.split('\n')[0].strip()
    
