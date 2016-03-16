import socket
import sys

HOST = '0.0.0.0' # Using localhost or 127.0.0.1 will return errors
PORT = 13375
secretInfo = "Gone Phishing"

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Set socket family and type
print 'Socket created'

# Try to bind socket to local host and port. Return error if unable.
try:
    s.bind((HOST, PORT))
except socket.error as msg:
    print 'Bind failed. Error Code : ' + str(msg[0]) + ' password = com.recv(1024) Message '  + msg[1]
    sys.exit()

print 'Socket bind complete'

s.listen(10) # Start listening on socket
print 'Socket now listening'

# Now keep talking with the client
while 1:
    # Checking for new data
    conn, addr = s.accept() # Waiting until connection arrives
    password = conn.recv(1024) # Recieve 1024 bit TCP message
    # Display IP address and port number of client
    print 'Connected with ' + addr[0] + ':' + str(addr[1])
    print "Password sent was "+ password
    # Check if recieved string is equal to the required password
    if password == "blathering blatherskite":
        conn.send(secretInfo)
    else:
        conn.send("Ah-ah-ah! You didn't say the magic words!")
s.close()

# Reference Binary Tides - http://www.binarytides.com/python-socket-server-code-example/
