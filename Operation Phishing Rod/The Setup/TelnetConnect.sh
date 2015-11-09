#! /bin/bash
function connect
{
  telnet 100.76.114.10
  echo "debian"
  echo "temppwd"
}
while true; do
    connect
    sleep 15 # 1 = 1 second delay
done
