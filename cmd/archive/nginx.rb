sudo apt update
sudo apt install nginx

# nginx (create files)
sudo nano /etc/nginx/sites-enabled/cvm.conf # create only
sudo nano /etc/nginx/conf.d/cvm.conf # create only

# NGINX
sudo nginx -t # verify syntax

# allow HTTP/HTTPS
sudo ufw allow 'Nginx Full' # 'Nginx HTTP' is an alternative

# see rules
sudo ufw status

# view IP address
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

# killall nginx
sudo killall nginx

# stop/start/restart
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx

# drop connections and apply changes
sudo systemctl reload nginx

# give sites enabled link to sites available
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/

# check for syntax errors
sudo nginx -t

# connect nginx to your rails project
sudo nano /opt/nginx/conf/nginx.conf

# add server info
server {
	listen 80; 
	server_name cvm;
	passenger_enabled on; 
	root /var/www/cvm/public; 
}

# links site to "enabled"
# sudo ln -s /etc/nginx/sites-available/rails /etc/nginx/sites-enabled/