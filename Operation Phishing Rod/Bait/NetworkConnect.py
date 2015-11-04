import time # to allow sleep command
import progressbar # third-party progress bar library
def displayConnectionInterface():
    confirmation = input('Are you sure you want to connect to server? (y/n) ')
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
displayConnectionInterface() # run all the code in the above function
