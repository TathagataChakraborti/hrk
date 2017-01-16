import socket, piku

REWARD_SIZE = 14

s = socket.socket()         # Create a socket object
host = socket.gethostname() # Get local machine name
port = 12345                # Reserve a port for your service.
s.bind((host, port))        # Bind to the port

s.listen(5)                 # Now wait for client connection.
old_timestamp = ''
# Now keep looping



user = "USER1" # XXX move to a config file
queue_name = user + ':' + 'REWARD_QUEUE'
url_str = os.environ.get('CLOUDAMQP_URL', 'amqp://yochan:yochan@'+CLOUD_NODE+'//')
url = urlparse.urlparse(url_str)
params = pika.ConnectionParameters(host=url.hostname, virtual_host=url.path[1:],
credentials = pika.PlainCredentials(url.username, url.password))
connection = pika.BlockingConnection(params)
channel = connection.channel()
channel.queue_declare(queue=queue_name)


while True:
    time.sleep(0.5)
    c, addr = s.accept()     # Establish connection with client.
    data = c.recv(REWARD_SIZE)
    channel.basic_publish(exchange='',
        	          routing_key=queue_name,
                	  body=data)

   
