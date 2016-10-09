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



rospy.init_node('form_words')
WAIT_LIMT = 5
SERVER_IP = ""
SERVER_PORT = ""
EXPERIMENT_COUNT = 4

currentStateQueue = Queue()
currentStatePosQueue = Queue()
humanActionQueue = Queue()
robotActionQueue = Queue()

monit = monitor([],'sample_obj.yaml',currentStateQueue, currentStatePosQueue, humanActionQueue, robotActionQueue)
monit.monitor()
robo_exec = RobotActionExecutorWord(monit.location_markers, monit.objects, monit.loc_marker_pos)
print monit.current_state_pos
table_marker_height = monit.loc_marker_pos[monit.location_markers[0]][2]
robo_exec.head_tilt_up()

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

sock.sendall(str(time.time())+'@3')
for i in range(EXPERIMENT_COUNT):
	rand_obj = numpy.randomState()
    rand_obj.shuffle(objectives)
    goal = objectives[-1]
    used_blocks = [configs['location_marker']]
    current_state = collect_current_state()
    old_pos = []
    print "starting with goal", goal
    for part in goal:
    	# may be add one more random choice
    	rand_obj = numpy.randomState()
    	surprise_event = False
    	if (rand_obj.choice(range(0,10)) >= 5):
            if goal_parts.ind(part) != 0:
        	   rand_obj = numpy.randomState()
        	   curr_choices = [part] + configs['random_blocks'] #also may be all blocks 
               rand_obj.shuffle(curr_choices)
               part = curr_choices[0]
               surprise_event = True
        current_state = None
        current_state = collect_current_state()
        print current_state
        block_list = configs['block_map'][part[ind]]
        for bl in block_list:
            if bl not in used_blocks:
                used_blocks.append(bl)
                break
        print "block is ",bl
        print "target ", monit.current_state_pos[used_blocks[-2]]
        old_pos.append((b1,current_state[b1]))
        robo_exec.execute_pickup(b1, current_state)
        robo_exec.return_to_initial_pos()
        robo_exec.execute_stack(used_blocks[-2],current_state) #monit.current_state_pos[bl], monit.current_state_pos[used_blocks[-2]])
        if surprise_event:
        	sock.sendall(str(time.time())+'@2')
        else:
        	sock.sendall(str(time.time())+'@1')
    for bl, pos in old_pos:
        current_state = collect_current_state()
        robo_exec.execute_pickup(b1, current_state)
        robo_exec.return_to_initial_pos()
        robo_exec.execute_putdown(pos)
    time.sleep(2)

    sock.sendall(str(time.time())+'@4')