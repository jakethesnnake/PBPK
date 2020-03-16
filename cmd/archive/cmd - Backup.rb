# ssh
167.172.204.255 # ip
sudo ssh -i /mnt/c/Users/jaked/.ssh/cvm root@167.172.204.255 # (laptop)

# create user
sudo adduser cvm

# configure auth
sudo mkdir -p ~cvm/.ssh
touch $HOME/.ssh/authorized_keys
sudo sh -c "cat $HOME/.ssh/authorized_keys >> ~cvm/.ssh/authorized_keys"
sudo chown -R cvm: ~cvm/.ssh
sudo chmod 700 ~cvm/.ssh
sudo sh -c "chmod 600 ~cvm/.ssh/*"

# switch user account
sudo -u cvm -H bash -l

# system installs
apt-get install zlib1g-dev
apt-get install libsqlite3-dev
apt install gnupg2
apt-get install libpq-dev
apt install libcurl4
apt-get install libcurl4-gnutls-dev
apt-get install curl
apt-get install nodejs
apt install nginx
apt install ruby-bundler

# (optional) system installs
apt-get install build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3



# keys
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7 # create pgp key
sudo gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# create APT source file
sudo nano /etc/apt/sources.list.d/passenger.list

# git (inside home/rails directory)
git clone https://github.com/jakethesnnake/CVM.git code
cd example
git checkout master

# (rename folder)

# CURL
sudo curl -L https://get.rvm.io | sudo bash -s stable # install RVM ~ optional: (-sSL -L)
sudo curl -sSL -L https://get.rvm.io | sudo bash -s stable # install RVM ~ optional: (-sSL -L)

# REBOOT
sudo apt autoremove
sudo reboot

# RVM requirements
rvm requirements
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

# passenger (swap)
rvmsudo passenger-install-nginx-module

sudo dd if=/dev/zero of=/swap bs=1M count=1024
sudo mkswap /swap
sudo swapon /swap

# start server
sudo service nginx start 

# connect nginx to rails project
sudo nano /opt/nginx/conf/nginx.conf

# bundle
bundle install

# tests
rails db:migrate RAILS_ENV=test
bundle exec rspec

# database
bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=development # deployment
bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=production # production (missing secret key)
bundle exec rake db:drop db:create db:migrate db:seed # generic

# validate and view processes
rvmsudo passenger-config validate-install 
rvmsudo passenger-memory-stats

# RELOAD AND RESTART
nginx -s quit # stop all processes
nginx -s reload # apply changes to config file
sudo nginx -t # verify syntax
sudo systemctl restart nginx.service # restart nginx
sudo systemctl reload nginx # opt??
sudo systemctl restart nginx # opt??

# start passenger

passenger start -a 127.0.0.1 -p 3000 -d -e development






