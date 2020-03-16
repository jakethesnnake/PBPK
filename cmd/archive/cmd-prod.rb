

# RESTART
rake db:drop db:create db:migrate db:seed
nginx -s quit # stop all processes
nginx -s reload # apply changes to config file
sudo nginx -t # verify syntax
systemctl restart rails.service # restart rails server
sudo systemctl restart nginx.service # restart nginx
sudo service nginx restart
bundle exec passenger start # start passenger

# ENVIRONMNET
rails db:environment:set RAILS_ENV=development

##### DEPLOY



mkdir ~/ruby
cd ~/ruby

wget http://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz
tar -xzf ruby-2.5.1.tar.gz
cd ruby-2.5.1
./configure
make
sudo make install
ruby -v # should print: ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
rm -rf ~/ruby

## Passenger install
sudo nano /etc/apt/sources.list.d/passenger.list

deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main # insert this line in the file

sudo chown root: /etc/apt/sources.list.d/passenger.list # change ownership
sudo chmod 600 /etc/apt/sources.list.d/passenger.list # change ownership

sudo apt-get update # update the apt cache

# sudo apt-get install nginx-extras passenger # install passenger with nginx

sudo nano /etc/nginx/nginx.conf

## FIND BOTH OF THESE LINES AND UNCOMMENT THEM
# passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
# passenger_ruby /usr/bin/ruby;
passenger_ruby /usr/local/bin/ruby; # and update the path in the passenger_ruby line

# disable default nginx configuration
sudo nano /etc/nginx/sites-available/default # open file

# comment out these lines
listen 80 default_server;
listen [::]:80 default_server ipv6only=on;

# create the nginx file for the app
sudo nano /etc/nginx/sites-available/cvm

# add the server block to the file
server {
  listen 80 default_server;
  passenger_enabled on;
  root /home/rails/example/public;
}

# create a symlink for it
sudo ln -s /etc/nginx/sites-available/cvm /etc/nginx/sites-enabled/cvm
# restart nginx
sudo nginx -s reload

cp /etc/apt/preferences.d/index.html /tmp
rm -rf /etc/apt/preferences.d/index.html
cp /etc/apt/sources.list  /tmp
rm -rf sources.list

sudo reboot