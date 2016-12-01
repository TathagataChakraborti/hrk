#!/usr/bin/env python

'''
Topic   :: main method
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/27/2016
'''

'''
Packages
'''


import argparse

from utils         import *

from Environment   import BlocksWorld

from Agent         import RandomAgent
from RLAgent       import RLAgent
from PlanningAgent import PlanningAgent


'''
Global variables
'''

_param_to_agent_map = {'rl'     : 'RLAgent',
                       'random' : 'RandomAgent',
                       'plan'   : 'PlanningAgent'}

'''
main function
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the main method.''',
                                     epilog      = '''Usage >> ./main.py -a rl -p -e 100 -r 2 -z 30 -s -g -b <filename>''')

    parser.add_argument('-a', '--agent',       type=str,                 help="Type of agent; e.g. rl, random, plan; default = rl.")
    parser.add_argument('-b', '--boot',        type=str,                 help="Boot from pickled agent.")
   
    parser.add_argument('-t', '--task',        type=int,                 help="Height of tower; range 1-3.")

    parser.add_argument('-r', '--replay',      type=int, default=3,      help="Number of replays; default = 3.")
    parser.add_argument('-e', '--episodes',    type=int, default=1000,   help="Number of episodes; default = 1000.")
    parser.add_argument('-z', '--threshold',   type=int, default=30,     help="Maximum length of an episode; default = 30.")

    parser.add_argument('-s', '--simulate',    action='store_true',      help="Simulate; runs on real robot otherwise.")
    parser.add_argument('-c', '--bootstrap',   action='store_true',      help="Bootstrap RLAgent on PDDL.")
    parser.add_argument('-p', '--train',       action='store_true',      help="Train agent flag.")
    parser.add_argument('-q', '--test',        action='store_true',      help="Test agent flag.")
 
    parser.add_argument('-x', '--epsilon',     type=float, default=0.2,  help="Epsilon for RL agent; default = 0.2.")
    parser.add_argument('-y', '--alpha',       type=float, default=0.9,  help="Learning rate for RL agent; default = 0.9.")
    parser.add_argument('-d', '--gamma',       type=float, default=0.5,  help="Discount Factor for RL agent; default = 0.5.")

    parser.add_argument('-g', '--save',        action='store_true',      help="Save agent.")

    args  = parser.parse_args()    

    if not args.agent: print parser.print_help()
    else:

        agent = eval(_param_to_agent_map[args.agent])(args)

        if args.task:

            plan, u = agent.execute(args.task, args.simulate)
            print '\nPlan >>\n{}\n;;cost = {}'.format('\n'.join(plan), u)

        elif args.train:

            agent.train(args.episodes, args.replay, args.simulate)
            
        else:pass

        if args.save: agent.save()
        print('Done.')

            
if __name__ == '__main__':
    main()

