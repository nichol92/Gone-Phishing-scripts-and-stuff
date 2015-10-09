import re # Import Regular Expression library
import threading # Multi-Threading increases the speed of execution
import sys # Import sys to allow for more user friendly exit (doesn't close window)
# The following code searches the 
def check(addressString, MAC_Address):
            if addressString in MAC_Address:
                print(MAC_Address)
                if (input("do you want to try another MAC address [y/n] ") == 'y'):
                    if __name__ == '__main__':
                        main() # run the main code again
                else:
                    sys.exit(0) # end the script                   
def main():
    # Asks user for MAC address and variable 'addressString' is set to what the user enters
    addressString = input("Please type the first 6 characters of your MAC address like XX:XX:XX ")
    # 'if' statement checks variable 'addressString' is in correct format
    if re.match("[0-9A-F]{2}([-:])[0-9A-F]{2}([-:])[0-9A-F]{2}$", addressString):
        print("correct format")
        # following code MUST include "encoding='utf-8'" to open and read correctly
        with open("manuf.txt", encoding='utf-8') as search:
            print("checking...")
            # 'for' loop checks each line for the MAC address, using multi-threading for speed
            for line in search:
                MAC_Address = line
                t = threading.Thread(target=check, args = (addressString, MAC_Address))
                t.start()
    else:
        # Error message because MAC address is in an invalid format
        print("ERROR: Incorrect format. Use the following format: XX:XX:XX")
        exit(0)
if __name__ == '__main__':
    main()
