#!/usr/bin/python           # This is server.py file

import socket               # Import socket module
import os
import time
import datetime

_PORT_WRITER_PATH = 'C:\hrk'

_PORT_NAME        = 'COM9'

_START_MARKER     = 3
_POSITIVE_MARKER  = 1
_NEGATIVE_MARKER  = 2
_END_MARKER       = 4
BUFFER_SIZE = 1024

def log(marker_id):
    os.system('{}\PortWrite.exe {} {}'.format(_PORT_WRITER_PATH, _PORT_NAME, marker_id))


s = socket.socket()         # Create a socket object
host = socket.gethostname() # Get local machine name
port = 12345                # Reserve a port for your service.
s.bind((host, port))        # Bind to the port

s.listen(5)                 # Now wait for client connection.
old_timestamp = ''
while True:
   c, addr = s.accept()     # Establish connection with client.
   #print 'Got connection from', addr
   data = c.recv(1)
   #curr_chunk = c.recv(1)
   #while curr_chunk:
   #	data += curr_chunk
   #	curr_chunk = c.recv(1)
   if data.strip() == '':
       continue
   log(int(data.strip()))
   c.close()                # Close the connection
