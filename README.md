# ban_wikipedia
## Why Ban Wikipedia?
I found that I would frequently do a search and find the answer on wikipedia. Instead of finding out information as quick as possible, I would spend lots of time trying to getter a deeper understanding and this would waste lots of time. I found that after banning wikipedia access to my computer that I have become much more productive.
## Requirements
This is built and tested on GNU/Linux OS. It should probably work on Mac if they have a hosts file as well. It will probably not work on Windows as I doubt they have a hosts file (just use your firewall).
## How to Use
If you want to ban other sites besides wikipedia simply enter its name in the BLOCKED_SITES array variable.

If you have cron then make the shell script executable and copy it into a cron folder so it is executed every hour: 
```chmod +x ban_wikipedia.sh; sudo cp ban_wikipedia.sh /etc/cron.hourly```
## How it Works
First the script will find the ip of the site through ping by contacting your DNS. It then puts the IP as well as the site name in the hosts file. This way there is no way the site can be accessed unless it changes it IP within 1 hour.
