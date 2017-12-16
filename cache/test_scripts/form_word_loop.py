import sys
import os
from word_formation import monitor
from RobotExecutor import RobotActionExecutor
from multiprocessing import Process
from Queue import Queue
import thread
import rospy
import time
import json
from std_msgs.msg import String
import subprocess
import yaml
import random
from head_bob import BobHead
import subprocess
from std_msgs.msg import String
import numpy
import socket
import copy


rospy.init_node('form_words')
WAIT_LIMT = 5
SERVER_IP = ""
SERVER_PORT = ""
EXPERIMENT_COUNT = 1
SERVER_COMM_FLAG = False

currentStateQueue = Queue()
currentStatePosQueue = Queue()
humanActionQueue = Queue()
robotActionQueue = Queue()

monit = monitor([],'sample_obj.yaml',currentStateQueue, currentStatePosQueue, humanActionQueue, robotActionQueue)
monit.monitor()
robo_exec = RobotActionExecutor(monit.location_markers, monit.objects, monit.loc_marker_pos)
print monit.current_state_pos
print monit.loc_marker_pos[monit.location_markers[0]]
table_marker_height = monit.loc_marker_pos[monit.location_markers[0]][2]
#robo_exec.head_tilt_up()
orig_loc_marker = monit.loc_marker_pos[monit.location_markers[0]]

if SERVER_COMM_FLAG:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Connect the socket to the port where the server is listening
    server_address = (SERVER_IP, SERVER_PORT)
    sock.connect(server_address)


with open('sample_obj.yaml') as cg_fd:
    configs = yaml.load(cg_fd)

with open('objectives.lst') as obj_fd:
    objectives = map(str.strip, obj_fd.readlines())

bob = BobHead()
msg_id = 0
def collect_current_state():
#   while True:
        print "Collecting human action"
        monit.monitor()
        bob.tilt_up()
        monit.monitor()
        bob.tilt_down()
        monit.monitor()
        bob.tilt_normal()
        while not currentStatePosQueue.empty():
            tmp = currentStatePosQueue.get()
        #currentStatePosQueue.put(monit.current_state_pos)
        return monit.current_state_pos

if SERVER_COMM_FLAG:
   sock.sendall(str(time.time())+'@3')
for i in range(EXPERIMENT_COUNT):
#    rand_obj = numpy.random.RandomState()
#    rand_obj.shuffle(objectives)
    print "Choose one out of the following words "
    for word in objectives:
        print objectives.index(word)," ",word
    word_ind_str = raw_input('Please input the word index ')
    word_ind = str(word_ind_str)
    goal = objectives[word_ind]
    used_blocks = [configs['location_markers'][0]]
    current_state = collect_current_state()
    old_pos = []
    print "starting with goal", goal
    for ind in range(len(goal)):
        print "############## used_blocks ###############--->", used_blocks
        part = goal[ind]
    	# may be add one more random choice
    	rand_obj = numpy.random.RandomState()
    	surprise_event = False
    	if (rand_obj.choice(range(0,10)) >= 5) and not surprise_event:
            if goal.index(part) != 0:
                   print "Random event Triggered"
        	   rand_obj = numpy.random.RandomState()
        	   curr_choice = configs['random_blocks'][0] #rand_obj.choice([part] + configs['random_blocks'],1)[0] #also may be all blocks 
                   if part != curr_choice:
                       surprise_event = True
                       part = curr_choice
        current_state = None
        current_state = collect_current_state()
        print current_state
        bl = configs['block_map'][part]
        print "block is ",bl
        used_blocks.append(bl[0])
        print "target ", current_state[bl[0]] #monit.current_state_pos[used_blocks[-2]]
        old_pos.append([bl,current_state[bl[0]]])
        robo_exec.execute_pickup(bl[0], current_state)
        robo_exec.return_to_initial_pos()
    	current_state = collect_current_state()
        robo_exec.execute_stack(used_blocks[-2],current_state) #monit.current_state_pos[bl], monit.current_state_pos[used_blocks[-2]])
        
        if SERVER_COMM_FLAG:
           if surprise_event:
        	sock.sendall(str(time.time())+'@2')
           else:
        	sock.sendall(str(time.time())+'@1')
        robo_exec.return_to_initial_pos()
        old_state = copy.deepcopy(current_state)
    	current_state = collect_current_state()
        if current_state[used_blocks[-1]] == old_state[used_blocks[-1]]:
             current_state[used_blocks[-1]] = orig_loc_marker
             print "curr state",current_state[used_blocks[-1]]
             current_state[used_blocks[-1]][2] += (len(used_blocks) - 1) * (0.045)
    time.sleep(2)

    if SERVER_COMM_FLAG:
       sock.sendall(str(time.time())+'@4')
