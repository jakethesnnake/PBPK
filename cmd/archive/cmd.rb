# ssh

167.172.221.202 # ip address
sudo ssh -i /mnt/c/Users/jaked/.ssh/pbpk root@167.172.221.202 # (laptop)

## installation
apt-get install zlib1g-dev libsqlite3-dev libpq-dev libcurl4-gnutls-dev curl nodejs
apt install gnupg2 libcurl4 nginx ruby-bundler

# (optional)
apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3

## update and upgrade
apt update && apt upgrade
apt-get update && apt-get upgrade

# autoremove
apt autoremove ; apt-get autoremove

# add keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7 # create pgp key
sudo gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# create APT source file
sudo nano /etc/apt/sources.list.d/passenger.list

# git (inside home/rails directory)
git clone https://github.com/jakethesnnake/CVM.git cvm
cd cvm
git checkout master # master-tmp for now

# CURL (install RVM)
sudo curl -L https://get.rvm.io | sudo bash -s stable
sudo curl -sSL -L https://get.rvm.io | sudo bash -s stable # (optional)

# REBOOT
sudo reboot

## RVM requirements
rvm requirements
# if missing requirements
rvmsudo /usr/bin/apt-get install build-essential openssl libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

# RVM
rvm install "ruby-2.5.1"
rvm use 2.5.1 --default
rvm rubygems current # install all required components

# gems (within project directory)
gem install rails -v '5.2.3'
gem install passenger

gem install ruby
gem install bundler --version '2.0.2'
gem install rubygems-bundler
gem install nokogiri -v '1.10.9' --source 'https://rubygems.org/'

## Passenger
rvmsudo passenger-install-nginx-module
# if modification required
sudo dd if=/dev/zero of=/swap bs=1M count=1024
sudo mkswap /swap
sudo swapon /swap

# (?) start server
sudo service nginx start

# bundle
bundle install

# tests
rails db:migrate RAILS_ENV=test
bundle exec rspec

# database
bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=development # deployment

# validate and view processes
# rvmsudo passenger-config validate-install 
# rvmsudo passenger-memory-stats

# RELOAD AND RESTART
nginx -s quit # stop all processes
nginx -s reload # apply changes to config file
sudo nginx -t # verify syntax
sudo systemctl restart nginx.service # restart nginx
sudo systemctl reload nginx # opt??
sudo systemctl restart nginx # opt??

# start passenger

passenger start -a 127.0.0.1 -p 3000 -d -e development