cmd=
for i in messages auth.log user.log daemon.log syslog rkhunter.log kern.log
   do 
   cmd="-I $i $cmd"
done
multitail -Cs -L ./filter_logs.sh \
  -I /var/ossec/logs/active-responses.log \
  -I /var/ossec/logs/ossec.log \
  -I /var/ossec/logs/alerts/alerts.log \

