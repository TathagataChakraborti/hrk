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
while True:
    current_state = collect_current_state()
    visible_letters = []
    for bl in current_state.keys():
         if len(current_state[bl]) > 0 and bl != 'ar_marker_15':
              visible_letters.append(configs['letter_map'][bl])
    print "####VISIBLE#### ", visible_letters #monit.current_state_pos[used_blocks[-2]]
    print "####VISIBLE#### ", current_state #monit.current_state_pos[used_blocks[-2]]
    time.sleep(2)

    if SERVER_COMM_FLAG:
       sock.sendall(str(time.time())+'@4')
