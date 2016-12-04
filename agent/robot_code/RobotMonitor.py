import os
import tf
import sys
import copy
import time


MONIT_INIT_TIME = 100

class Monitor:

    def __init__(self, object_map, location_markers):
        self.object_map = object_map
        self.location_markers = location_markers
        self.object_pos = {obj:[] for obj in self.object_map.keys()}
        self.location_pos = {marker:[] for marker in self.location_markers.keys()}
        self.init_location_markers()
        bob = BobHead()
        self.monit()


    def get_marker_position(self, marker):
        marker_pos = ()
        marker_orient = ()
        try:
            marker_pos, marker_orient = self.tf_listener.lookupTransform('/base_link', marker,rospy.Time(0) )
        except:
            try:
                marker_pos, marker_orient = self.tf_listener.lookupTransform('/base_link', marker, rospy.Time(0))
            except:
                marker_pos = ()
		marker_orient = ()
        return marker_pos, marker_orient


    def init_location_markers(self):
        all_markers_not_found = True
        start_time = time.time()
        while all_markers_not_found:
            all_markers_not_found = False
            for marker in self.location_markers:
                pos, orient = self.get_marker_position(marker)
                if len(pos) == 0:
                    all_markers_not_found = True
                else:
                    self.location_pos[marker] = list(pos)
            if (time.time() - start_time) > MONIT_INIT_TIME:
                raise StandardError

    def monit(self):
        bob.tilt_normal()
        self.update_obj_positions()
        bob.tilt_up()
        self.update_obj_positions()
        bob.tilt_down()
        self.update_obj_positions()


    def update_obj_positions(self):
        for obj in self.object_pos.keys():
            pos, orient = self.get_marker_position(self.object_map['obj'])
            if len(pos) != 0:
                self.object_pos[obj] = list(pos)


