# Restart Network
nginx -s quit ; nginx -s reload
systemct1 restart nginx.service ; systemctl reload nginx
systemctl restart nginx ; service nginx restart



##### (old) #####
# RELOAD AND RESTART
nginx -s quit # stop all processes
nginx -s reload # apply changes to config file
sudo nginx -t # verify syntax
sudo systemctl restart nginx.service # restart nginx
sudo systemctl reload nginx # opt??
sudo systemctl restart nginx # opt??