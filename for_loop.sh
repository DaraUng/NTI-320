    
#!/bin/bash
for servername in $(gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios-install );  do 
    echo $servername;
    serverip=$( gcloud compute instances list | grep $servername | awk '{print $4}');
    echo $serverip ;
    bash scp_nagios web-a 10.150.0.5
done

gcloud compute ssh dara_ung@nagios-install --command='sudo systemctl resstart nagios'
#awk is the last name initial for the writer.
#awk is for colum
#sed is for roll
#sed is search and replace
#grep is remove
