# ip address

167.172.203.120

## installation

apt-get install zlib1g-dev libsqlite3-dev libpq-dev libcurl4-gnutls-dev curl nodejs
apt install gnupg2 libcurl4 nginx ruby-bundler
apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3

## update and upgrade

apt update && apt upgrade
apt-get update && apt-get upgrade

## add gpg keys

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7 # create pgp key
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

## GIT (clone repository)

git clone https://github.com/jakethesnnake/PBPK.git pbpk
cd pbpk
git checkout master # master-tmp for now

## CURL (install RVM)

curl -L https://get.rvm.io | bash -s stable

## REBOOT

sudo reboot

## View RVM requirements

rvm requirements

## if missing requirements:

rvmsudo /usr/bin/apt-get install build-essential openssl libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

# RVM install

rvm install "ruby-2.5.1"
rvm use 2.5.1 --default
rvm rubygems current

# gems (within project directory)

gem install rails -v '5.2.3'
gem install passenger

gem install ruby
gem install bundler --version '2.0.2'
gem install rubygems-bundler
gem install nokogiri -v '1.10.9' --source 'https://rubygems.org/'

## Passenger

rvmsudo passenger-install-nginx-module

# bundle

bundle install

# tests
rails db:migrate RAILS_ENV=test
bundle exec rspec

# database

bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=development

# stop and disable systemct1 nginx

systemct1 status nginx
systemctl stop nginx
systemctl disable nginx

# start nginx server

service nginx start

# start passenger

# sending kill signal

for /f "tokens=5" %a in ('netstat -aon ^| find ":8080" ^| find "LISTENING"') do taskkill /f /pid %a

kill $(lsof -t -i :3000) # KILLS PORT 3000
kill $(lsof -t -i :3000)

sudo fuser -k 3000
killall nginx
service nginx restart
passenger start -a 127.0.0.1 -p 3000 -d -e development

