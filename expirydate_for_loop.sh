#set the variable for the date

current_date = $(date +%y-%m-%d)
expiry_date = $(whois google.com | grep Expiry | awk '{print $4}' | awk -F "T" '{pri
nt $1}')


#Calculation

#while [current_date != expiry_date] ; do
#      current_date - date



#whois google.com | grep Expiry | awk '{print $4}' | awk -F "T" '{pri
#nt $1}'
