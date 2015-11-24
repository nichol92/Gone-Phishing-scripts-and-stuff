import socket
host = '192.168.123.123'
port = 13375
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Set socket family and type
s.connect((host,port)) # Initiate TCP server connection
s.send("blathering blatherskite") # Send password
data = s.recv(1024) # Recieve response from listening device
print(data) # Display the response
