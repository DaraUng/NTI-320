for servername in $( gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios-a );  do 
    gcloud compute ssh --zone us-east4-c dara_ung@$servername --command='sudo yum -y install wget && sudo wget https://raw.githubusercontent.com/DaraUng/NTI-320/master/nrpe.sh'
done
