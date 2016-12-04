#!/usr/bin/env python

import rospy
from actionlib import SimpleActionClient
from control_msgs.msg import FollowJointTrajectoryAction, FollowJointTrajectoryGoal
from trajectory_msgs.msg import JointTrajectoryPoint


class BobHead:
    def __init__(self):
        self.client = SimpleActionClient('head_controller/follow_joint_trajectory', FollowJointTrajectoryAction)
        self.client.wait_for_server()

    def execute(self, _index):
        point = JointTrajectoryPoint()  # create a new point to store values
        point.positions.append(_index)
        point.positions.append(0)
        point.velocities.append(0)  # these are actually important
        point.velocities.append(0)
        point.time_from_start = rospy.Duration(0.125)

        goal = FollowJointTrajectoryGoal()
        goal.trajectory.joint_names.append('head_tilt_joint')  # you need both of these
        goal.trajectory.joint_names.append('head_pan_joint')
        goal.trajectory.points.append(point)

        self.client.send_goal(goal)
        self.client.wait_for_result(rospy.Duration.from_sec(5.0))
        rospy.loginfo("moved head")

    def tilt_normal(self):
        self.execute(0.82)

    def tilt_up(self):
        self.execute(0.55)

    def tilt_down(self):
        self.execute(1.02)
#        self.execute(1.12)

if __name__ == '__main__':
    try:
        b = BobHead()
        b.tilt_down()
        b.tilt_up()
        b.tilt_normal()
    except rospy.ROSInterruptException:
        pass
