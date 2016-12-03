#!/usr/bin/env python

'''
Topic   :: environment definitions
Project :: CSE 591 - Human Robot Kumbaya
Author  :: Tathagata Chakraborti
Date    :: 11/27/2016
'''

'''
Packages
'''

import os, re, copy
from utils import *

'''
Class :: Environment
'''

class Environment:
    
    def __init__(self, *args):
        self.actionList   = []
        self.currentState = Counter()
        self.goalState    = Counter()

    def getActions(self, state = None):
        return self.actionList

    def getCurrentState(self):
        return self.currentState

    def getGoalState(self):
        return self.goalState

    def isGoal(self, state):
        return set(self.goalState.items()).issubset(set(state.items()))

    def observeTransition(self, currentState, action, simulate_flag = True, bootstrap_flag = False):

        nextState = self.__generate_next_state__(currentState, action, simulate_flag)
        reward    = self.__generate_reward__(currentState, action, nextState, simulate_flag, bootstrap_flag)

        return currentState, action, nextState, reward

    def __generate_next_state__(self, state, actionName, simulate_flag):
        raise NotImplementedError()
        
    def __generate_reward__(self, currentState, action, nextState, simulate_flag, bootstrap_flag):
        raise NotImplementedError()


'''
Class :: BlocksWorld
'''

class BlocksWorld(Environment):

    _domain_fileName   = 'domain/domain.pddl'
    _problem_fileName  = 'temp-problem.pddl'
    _template_fileName = 'domain/template.pddl'

    def __init__(self, *args):

        Environment.__init__(self, *args)

        with open('domain/init.dat', 'r') as temp:
            self.currentState = Counter({item.strip() : 1 for item in temp.read().split('\n')})

        self.setGoal(args[0])
        self.write_to_problem()

            
    def setGoal(self, height):
        self.goalState = Counter({'tower{}-formed'.format(height) : 1})

    def setState(self, state):
        self.currentState  = copy.deepcopy(state)

    def getPlan(self):

        self.write_to_problem()

        output = os.popen("./fdplan.sh {} {}".format(self._domain_fileName, self._problem_fileName)).read().strip()
        plan   = '\n'.join([' '.join(item.split(' ')[:-1]) for item in output.split('\n')[:-1]])
        cost   = output.split('\n')[-1].split(' ')[-1].strip()

        return plan, cost

    def getActions(self, state = None):
        return [actionName for actionName in self.actionList if self.__executable__(state, actionName)]

    def write_to_problem(self):

        with open(self._template_fileName, 'r') as template_file:
            template = template_file.read()

        template = template.format('\n'.join(['({})'.format(item) for item in self.currentState]), '\n'.join(['({})'.format(item) for item in self.goalState]))
        
        with open(self._problem_fileName, 'w') as temp_file:
            temp_file.write(template)

        os.system("./ground.sh {} {} > stdout.txt".format(self._domain_fileName, self._problem_fileName))
        self.createActionList('tr-domain.pddl')

    def cleanup(self):
        os.system('rm -f *-domain.pddl *-problem.pddl output output.sas sas_plan stdout.txt *.stats obs.dat *~')

    def createActionList(self, domainFileName):
        with open(domainFileName, 'r') as domain_file:
            self.actionList = {item.split(' ')[1].lower().replace('_', ' ') : self.PDDLaction(item) \
                               for item in re.findall('\(:action.*?\)[\s+]*\)[\s+]*\)', re.sub('[\s+]', ' ', domain_file.read().lower()))}
            
    def __executable__(self, state, actionName):
        return all([int(self.actionList[actionName].preconditions[var]) == state[var] for var in self.actionList[actionName].preconditions.keys()])

    def __generate_next_state__(self, state, actionName, simulate_flag):

        if simulate_flag:

            new_state = copy.deepcopy(state)
            for var in self.actionList[actionName].effects.keys():
                new_state[var] = int(self.actionList[actionName].effects[var])
            return new_state

        else:

            # launch fetch routines on thread #
            raise NotImplementedError()
        
    def __generate_reward__(self, currentState, action, nextState, simulate_flag, bootstrap_flag):

        if bootstrap_flag:

            # pause loop here, log anagha's output #
            raise NotImplementedError()

        else:
            
            if self.isGoal(nextState): return 100.0
            else:                      return -1.0

            
    '''
    Class :: pddl action instance
    '''
    
    class PDDLaction:
        
        name          = ''
        preconditions = Counter()
        effects       = Counter()

        def __init__(self, description):

            self.name                  = re.search('\(:action(.*?)[\s+]*:', description).group(1).strip()

            try:    self.preconditions = Counter({re.search('\(((?!not).*?)\)', item).group(1).strip().replace('_', ' ') : not 'not ' in item \
                                                  for item in re.findall('(\(not[\s+]*\(.*?\)[\s+]*\)|\(.*?\))', re.search(':precondition[\s+]*\(and(.*?)\)[\s+]*:', description).group(1))})
            except: pass
            
            try:    self.effects       = Counter({re.search('\(((?!not).*?)\)', item).group(1).strip().replace('_', ' ') : not 'not ' in item \
                                                  for item in re.findall('(\(not[\s+]*\(.*?\)[\s+]*\)|\(.*?\))', re.search(':effect[\s+]*\(and(.*?)\)[\s+]*(\(:action|\)[\s+]*$)', description).group(1))})
            except: pass

            self.__remove_negated_atom_from_dict__(self.preconditions)
            self.__remove_negated_atom_from_dict__(self.effects)

            
        def __remove_negated_atom_from_dict__(self, dictName):

            for key in dictName.keys():
                if 'not-' in key:
                    updated_key   = key.replace('not-', '')
                    updated_value = not dictName[key]

                    if updated_key in dictName:
                        if dictName[updated_key] != updated_value: raise KeyError("Grounding failed! Negated atom does not match assignment.")
                    else:
                        dictName[updated_key] = updated_value

                    dictName.pop(key)

                    
'''
main function
'''

def main():

    parser = argparse.ArgumentParser(description = '''This is the Environment class.''',
                                     epilog      = '''Usage >> ./Environment.py -g 2 -p''')

    parser.add_argument('-g', '--goal',  type=int, default=3,  help="Blocksworld goal = height of tower; default = 3.")
    parser.add_argument('-p', '--plan',  action='store_true',  help="Compute plan.")

    args   = parser.parse_args()
    env    = BlocksWorld()

    if args.goal:

        env.setGoal(args.goal)
        if args.plan: print 'Plan >>\n{}\n;;cost = {}'.format(*env.getPlan())

    else:pass
    
    env.cleanup()
    
if __name__ == '__main__':
    main()

