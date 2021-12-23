
#!/bin/bash

#Show from which ip were the most requests
echo "1. This ip-address completed the most request:"
	less /home/devops/Task7.1/apache_logs.txt | cut -d' ' -f1 | sort | uniq -c | sort -n | tail -n 1

#Show what is the most requested page?
echo "2. This TOP 5 pages is the most requested:"
	tail -5000 /home/devops/Task7.1/apache_logs.txt | awk '{print $7}' | sort | uniq -c | sort -rn | head -5

#How many requests were there from each ip?
echo "3. The following number of requests were made from each ip address:"
	less /home/devops/Task7.1/apache_logs.txt | cut -d' ' -f1 | sort | uniq -c

#What non-existent pages were clients referred to?
echo "4. The number of non-existent pages that clients referred to:"
	grep "error404 " /home/devops/Task7.1/apache_logs.txt | awk '{print $7}' | cut -d ' ' -f 7 | sort | uniq -c | sort -nr

# What time did site get the most requests? 
echo "5. The site received the most requests at this time:"
	less /home/devops/Task7.1/apache_logs.txt | awk '{print $4}' |tr -d '[' | sort | uniq -c | sort -gr | head -n 10

# What search bots have accessed the site? (UA + IP)?
echo "6. Such search bots visited the site"
	grep "bot" /home/devops/Task7.1/apache_logs.txt | awk -F\" '{ print $6 }' | sort | uniq -c | head -n 10

