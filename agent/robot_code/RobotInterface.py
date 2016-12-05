import os
import yaml
import rospy
import time
import copy
import rospy
from .RobotMonitor import Monitor
from .RobotExecutor import RobotActionExecutor

color_map = {'red':'b1','blue':'b2','green':'b3','yellow':'b4','pink':'b5'}

class RobotInterface:

    def __init__(self):
        rospy.init_node('fetch')
        # Read all the config
        marker_config = os.path.dirname(os.path.realpath(__file__)) + '/sample.yaml'
        with open(marker_config) as config_fd:
            tmp_config = yaml.load(config_fd)
        for key in tmp_config.keys():
            setattr(self, key, tmp_config[key])

        # Perform initial monitor
        self.monit = Monitor(self.object_map, self.location_markers)

        # Create the executor object
        self.robo_exec = RobotActionExecutor(self.location_markers, self.objects, self.monit.location_pos)
        

    def get_next_state(self, current_state, action):
        # Run monitor
        self.monit.monit()
        # Execute action
        action_parts = action.lower().split(' ')
        print action_parts
        status = self.robo_exec.execute_action(action_parts[0], [color_map[i] for i in action_parts[1:]], self.monit.object_pos, self.monit.location_pos)
        return status

