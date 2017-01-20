import socket, pika

REWARD_SIZE = 43

s = socket.socket()         # Create a socket object
host = socket.gethostname() # Get local machine name
port = 12345                # Reserve a port for your service.
s.bind((host, port))        # Bind to the port

s.listen(5)                 # Now wait for client connection.
old_timestamp = ''
# Now keep looping



user = "USER1" # XXX move to a config file
queue_name = user + ':' + 'REWARD_QUEUE'
queue_name_graph = user + ':' + 'GRAPH_QUEUE'

url_str = os.environ.get('CLOUDAMQP_URL', 'amqp://yochan:yochan@'+CLOUD_NODE+'//')
url = urlparse.urlparse(url_str)
params = pika.ConnectionParameters(host=url.hostname, virtual_host=url.path[1:],
credentials = pika.PlainCredentials(url.username, url.password))

connection = pika.BlockingConnection(params)

channel = connection.channel()
channel.queue_declare(queue=queue_name)

channel2 = connection.channel()
channel2.queue_declare(queue=queue_name_graph)


while True:
    time.sleep(0.5)
    c, addr = s.accept()     # Establish connection with client.
    data = c.recv(REWARD_SIZE)
    enagagement = body[8:14]
    stress = body[15:21]
    interest = body[22:28]
    relaxation = body[29:35]
    excitement = body[36:42]
    reward = (0.6 - stress)* 1000
    channel.basic_publish(exchange='',
        	          routing_key=queue_name,
                	  body=reward)

    channel2.basic_publish(exchange='',
                           routing_key=queue_name_graph,
                           body=data)


