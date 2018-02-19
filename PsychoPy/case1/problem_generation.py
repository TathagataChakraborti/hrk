#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy.random import random, randint, normal, shuffle, choice
from openpyxl import Workbook
import os  # handy system and path functions
import sys  # to get file system encoding


# Variables of the experiment Case2
choiceDict = {1: 'blue.png', 2: 'red.png', 3: 'green.png'}
videoDict = {1: 'video1.mp4', 2: 'video2.mp4', 3: 'video3.mp4', 4: 'video4.mp4', 5: 'video5.mp4', 6: 'video6.mp4'}

n = 5      # number of trials


def write_excel_file(col_list):
    wb = Workbook(write_only=True)
    ws = wb.create_sheet()

    ws.append(["videoFile", "imageFile"])

    for i in range(n):
        ws.append(['%s' % j for j in col_list[i]])

    wb.save('conditions.xlsx')

if __name__ == "__main__":
    prob_list = randint(1, 6, n)
    prob_choice = randint(1, 3, n)
    col_list = []

    for i in range(n):
        col1 = videoDict[prob_list[i]]
        col2 = choiceDict[prob_choice[i]]

        col_list.append([col1, col2])

    write_excel_file(col_list)

