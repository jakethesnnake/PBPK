# TUTORIAL
https://www.phusionpassenger.com/docs/tutorials/deploy_to_production/deploying_your_app/oss/aws/ruby/nginx/#rails_login-as-the-app-s-user

# add cvm user and make sure it has ssh key installed
sudo adduser cvm # create user
sudo mkdir -p ~cvm/.ssh
touch $HOME/.ssh/authorized_keys
sudo sh -c "cat $HOME/.ssh/authorized_keys >> ~cvm/.ssh/authorized_keys"
sudo chown -R cvm: ~cvm/.ssh
sudo chmod 700 ~cvm/.ssh
sudo sh -c "chmod 600 ~cvm/.ssh/*"

# store code in a permanent location
sudo mkdir -p /var/www/cvm
sudo chown cvm: /var/www/cvm

# pull code
cd /var/www/cvm
sudo -u cvm -H git clone https://github.com/jakethesnnake/CVM.git code
git checkout master

# All subsequent instructions must be run under the application's user account
sudo -u cvm -H bash -l

# RVM
rvm use ruby-2.5.1

# install dependencies
cd /var/www/cvm/code
bundle install --deployment # --without development test

# Configure database.yml and secrets.yml
nano config/database.yml
	# ensure that production looks like this:
		# production:
		  # adapter: sqlite3
		  # database: db/production.sqlite3

# generate a secret key
bundle exec rake secret
# SECRET = 2dddedde61cad13994686951086e70e5641e83574987f1ac27a17ab7ee6be95680ae7dc35aeb5f17b3f5cd8cf4ee92bc5739297ad94df794225c08165a4e6720

nano config/secrets.yml
# then paste the secret (or export into environment)
# production:
  # secret_key_base: 2dddedde61cad13994686951086e70e5641e83574987f1ac27a17ab7ee6be95680ae7dc35aeb5f17b3f5cd8cf4ee92bc5739297ad94df794225c08165a4e6720
  # secret_key_base: <%=ENV["SECRET_KEY_BASE"]%> # (ALTERNATIVE)


# tighten up security
chmod 700 config db
chmod 600 config/database.yml config/secrets.yml

# compile assets and run db migrations and seeds
bundle exec rake assets:precompile db:migrate db:seed RAILS_ENV=production

# go back to admin account
exit

# We need to create an Nginx configuration file and setup a virtual host entry that points to the app
sudo nano /etc/nginx/sites-enabled/cvm.conf
sudo nano /etc/nginx/conf.d/cvm.conf

# we need to setup a virtual host entry that points to our app
sudo nano /opt/nginx/conf/nginx.conf

# and we paste this code in
server {
    listen 80;
    
    server_name localhost
	#server_name yourserver.com;

    # Tell Nginx and Passenger where your app's 'public' directory is
    root /var/www/cvm/code/public;

    # Turn on Passenger
    passenger_enabled on;
    passenger_ruby /usr/local/rvm/wrappers/ruby-2.5.1/ruby;
}

## NGINX

# purge old version
sudo apt-get purge nginx nginx-full nginx-light nginx-common
sudo rm -rf /etc/nginx

# install
gem install passenger --no-rdoc --no-ri
passenger-install-nginx-module

# validate
rvmsudo passenger-config validate-install
rvmsudo passenger-memory-stats