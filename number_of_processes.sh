#!bin/bash/

#This is a script meant to let us test NRPE
#Plugiins we write

status=$(ps aux | grep -c "")             #This will show the status of the nrpe base on the number.
if [ $status -le "100" ]; then
      echo "STATUS:OK"
      exit 0;
    elif [ $status -ge "150" ]; then
      echo "STATUS:CRITICAL"
      exit 2;
    elif [ $status -ge "200" ]; then
      echo "STATUS:WARNING"
      exit 1;
else
  echo "STATUS:UNKNOWN"
  exit 3;
fi
