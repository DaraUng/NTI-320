for servername in $( gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios-install );  do 
    gcloud compute ssh --zone us-west1-b dara_ung@$servername --command='sudo yum -y install wget && sudo wget https://raw.githubusercontent.com/DaraUng/NTI-320/master/rsyslog.sh?_sm_au_=iVV4SDvqwvsZQMMs && sudo bash rsyslog.sh'
done
