# Slack Status Reminder
![notification image](https://i.imgur.com/QXnHb7D.png)

### Background

- Running `reminder.sh` will get the city name of your IP address and send you a reminder if it is not 'Waltham'
- You can have the script run automatically with cron (see below)
- This was made as an internal tool for my office

### Pre-reqs

- Mac OSX
- Install dependencies: `brew install jq terminal-notifier`
  - [jq](https://github.com/stedolan/jq) is a JSON parser and [terminal-notifier](https://github.com/julienXX/terminal-notifier) is for sending Mac OS X notifications

### Tips

- Clicking on the notification will open Slack
- The notification will auto-hide in 5s. If you want to keep it open until dismissed, change the type from 'Banner' to 'Alert' (Settings - Nofitications - Terminal Notifier)

### To run automatically

- Download `reminder.sh`
- Open your cron file with `crontab -e`
- Paste this line while adjusting file path to run Mon-Fri at 9:05 am

  `5 9 * * 1-5 cd ~/scripts/slack-status-reminder && ./ip-reminder.sh`
