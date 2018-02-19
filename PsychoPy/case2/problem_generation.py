#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice
from openpyxl import Workbook
import os  # handy system and path functions
import sys  # to get file system encoding


# Variables of the experiment Case2
imageDict = {'blue': 'blue.png', 'red': 'red.png', 'green': 'green.png', 'yellow': 'yellow.png', 'orange': 'orange.png'}

videoDict = {1: 'video1.mp4', 2: 'video2.mp4', 3: 'video3.mp4', 4: 'video4.mp4', 5: 'video5.mp4', 6: 'video6.mp4',
             7: 'video7.mp4', 8: 'video8.mp4', 9: 'video9.mp4', 10: 'video10.mp4'}

problemDict = {1: ['orange', 'red', 'blue'], 2: ['green', 'red', 'blue'], 3: ['yellow', 'red', 'blue'], 4: ['red', 'orange', 'blue'],
               5: ['green', 'orange', 'blue'], 6: ['yellow', 'orange', 'blue'], 7: ['red', 'green', 'blue'],
               8: ['orange', 'green', 'blue'], 9: ['yellow', 'green', 'blue'], 10: ['red', 'yellow', 'blue']}

p1 = 0.5    # probability of correct grounding
p2 = 0.3    # probability of wrong second block
p3 = 0.2    # probability of wrong third block

n = 5      # number of trials


def write_excel_file(col_list):
    wb = Workbook(write_only=True)
    ws = wb.create_sheet()

    ws.append(["videoFile", "image3File", "image2File", "image1File"])

    for i in range(n):
        ws.append(['%s' % j for j in col_list[i]])

    wb.save('conditions.xlsx')

if __name__ == "__main__":
    prob_list = randint(1, 10, n)
    prob_choice = choice(np.arange(3), n, p=[p1, p2, p3])

    col_list = []

    for i in range(n):
        col1 = videoDict[prob_list[i]]
        ch = prob_choice[i]
        one, two, three = problemDict[prob_list[i]]
        col2 = imageDict[one]
        col3 = imageDict[two]
        col4 = imageDict[three]

        if ch != 0:
            for j in imageDict:
                if j not in problemDict[prob_list[i]]:
                    random_color = j
                    break

            if ch == 1:
                col3 = imageDict[j]
            else:
                col2 = imageDict[j]

        col_list.append([col1, col2, col3, col4])

    write_excel_file(col_list)

