import os
import yaml
import rospy
import time
import copy
from .RobotMonitor import Monitor
from .RobotExecutor import RobotActionExecutor
class RobotInterface:

    def __init__(self):
        # Read all the config
        marker_config = 'sample.yaml'
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
        action_parts = action.lower().split('_')
        status = self.robo_exec.execute_action(action_parts[0], action_parts[1:], self.monit.object_pos, self.monit.location_pos)
        return status

