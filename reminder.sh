#!/bin/sh

# A Mac OSX reminder to set your slack status if not in the office
# Readme: https://github.com/trybick/slack-status-reminder

ip=$(curl -s https://ipinfo.io/ip)
city=$(curl -s https://ipvigilante.com/${ip} | /usr/local/bin/jq ".data.city_name")

msg="Reminder to check your slack status"
ca_icon="https://img.icons8.com/doodle/48/000000/books.png"
remote_icon="https://img.icons8.com/dusk/64/000000/home.png"

if [[ $city =~ "Waltham" ]]; then
    exit
elif [[ $city =~ "Concord" || $city =~ "Billerica" ]]; then
    /usr/local/bin/terminal-notifier \
        -activate "com.tinyspeck.slackmacgap" \
        -title "Looks like you're at CA" \
        -appIcon "$ca_icon" \
        -message "$msg"
else
    /usr/local/bin/terminal-notifier \
        -activate "com.tinyspeck.slackmacgap" \
        -title "Looks like you're remote" \
        -appIcon "$remote_icon" \
        -message "$msg"
fi
