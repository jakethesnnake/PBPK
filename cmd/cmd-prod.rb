############## CVM
159.89.156.174 # ip
sudo ssh -i /mnt/c/Users/jake/.ssh/cvm root@159.89.156.174 # ip

# user
john | doe

echo 'export APPNAME_DATABASE_PASSWORD="doe"' >> ~/.bashrc

# cmd
ruby -v
rm -rf ~/ruby

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo nano /etc/apt/sources.list.d/passenger.list
deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main


########### OLD
systemctl restart rails.service # restart server

# PROCESS
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7 # create pgp key
sudo nano /etc/apt/sources.list.d/passenger.list # create APT source file

# RESTART
rake db:drop db:create db:migrate db:seed
nginx -s quit # stop all processes
nginx -s reload # apply changes to config file
sudo nginx -t # verify syntax
sudo systemctl restart nginx.service # restart nginx
bundle exec passenger start # start passenger

# ENVIRONMNET
rails db:environment:set RAILS_ENV=development