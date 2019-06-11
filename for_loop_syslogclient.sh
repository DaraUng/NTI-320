for servername in $( gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios-install );  do 
    gcloud compute ssh --zone us-west1-b dara_ung@$servername --command='sudo yum -y install wget && sudo wgethttps://raw.githubusercontent.com/DaraUng/NTI-320/master/syslogclient.sh && sudo bash syslogclient.sh'
done
