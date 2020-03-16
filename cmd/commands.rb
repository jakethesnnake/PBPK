# Save IP ADDRESS Here

x.x.x.x

## DEPLOYMENT INSTRUCTIONS (16 steps)

## (1) installation

apt-get install zlib1g-dev libsqlite3-dev libpq-dev libcurl4-gnutls-dev curl nodejs

apt install gnupg2 libcurl4 nginx ruby-bundler gpgv2

apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3

## (2) recovery keys

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7

## (3) clone git repository

cd /var/www
git clone https://github.com/jakethesnnake/PBPK.git pbpk
cd pbpk
git checkout master

## (4) REBOOT

reboot

## (5) import gpg keys and install RVM with CURL

gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L https://get.rvm.io | bash -s stable

## (6) REBOOT

reboot

## (7) Check RVM requirements

rvm requirements

## (8) run this command if there are missing requirements

rvmsudo /usr/bin/apt-get install build-essential openssl libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

## (9) RVM install (2.5.1)

rvm install "ruby-2.5.1"
rvm use 2.5.1 --default

## (10) Gem Installs

cd /var/www/pbpk
gem install bundler --version '2.0.2'
gem install rails -v '5.2.3'
gem install passenger
gem install rubygems-bundler
gem install nokogiri -v '1.10.9' --source 'https://rubygems.org/'

## (11) bundle

bundle

## (12) allocate space for passenger and avoid warning

dd if=/dev/zero of=/swap bs=1M count=1024 ; mkswap /swap ; swapon /swap
export rvmsudo_secure_path=1

## (13) Passenger

rvmsudo passenger-install-nginx-module
    # select Ruby
    # enter (1)

## (14) Run Test Suite and Setup Database

rails db:migrate RAILS_ENV=test
rspec
rake db:drop db:create db:migrate db:seed RAILS_ENV=development

## (15) start up network and bind to port 3000

service nginx start
kill $(lsof -t -i :3000)
service nginx restart
passenger start -a 127.0.0.1 -p 3000 -d -e development

## (16) restart network

nginx -s quit ; nginx -s reload
systemctl restart nginx.service ; systemctl reload nginx
systemctl restart nginx ; service nginx restart

## APPLICATION SHOULD BE LIVE (visit public IP address)