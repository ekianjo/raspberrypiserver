#!/bin/bash
#add repository for stretch packages, enabling the installation of PHP7 (more memory efficient) and Nginx1.9
sudo add-apt-repository "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi"

#create logfile in home/pi/
touch ~/logfile.txt

#create typical directories in home
mkdir ~/Videos
mkdir ~/Pictures
mkdir ~/Music
mkdir ~/Downloads
mkdir ~/Temp
mkdir ~/Documents
mkdir ~/Documents/Coding
mkdir ~/Sync

#ensure that by default all packages are prioritized to Jessie unless specified
sudo sed -i '$ a\Package: *' /etc/apt/preferences | tee -a logfile.txt
sudo sed -i '$ a\Pin: release n=jessie' /etc/apt/preferences | tee -a logfile.txt
sudo sed -i '$ a\Pin-Priority: 600' /etc/apt/preferences | tee -a logfile.txt

#update all sources and upgrade all
sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get upgrade | tee -a logfile.txt

#install regular stuff
sudo apt-get -y install rsync vim mysql-server ncdu weechat-curses fail2ban htop tmux glances aria2 youtube-dl python-pip python3 python3-pip task surfraw mutt ffmpeg netcat iftop mtr newsbeuter | tee -a logfile.txt
sudo pip install mps | tee -a logfile.txt
sudo pip install haxor-news | tee -a logfile.txt
sudo pip3 install hangups | tee -a logfile.txt

#install php7 from stretch repo
sudo apt-get -y install -t stretch php7.0 php7.0-curl php7.0-gd php7.0-fpm php7.0-cli php7.0-opcache php7.0-mbstring php7.0-xml php7.0-zip | tee -a logfile.txt

php -v | tee -a logfile.txt

#install nginx from stretch repo
sudo apt-get -y install -t stretch nginx | tee -a logfile.txt

#modify nginx and php fpm to add user pi

