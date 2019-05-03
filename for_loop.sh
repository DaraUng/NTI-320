    
#!/bin/bash
for servername in $(gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios-install );  do 
    echo $servername;
    serverip=$( gcloud compute instances list | grep $servername | awk '{print $4}');
    echo $serverip ;
done

#awk is the last name initial for the writer.
#awk is for colum
#sed is for roll
#sed is search and replace
#grep is remove
