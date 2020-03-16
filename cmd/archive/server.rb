server { 
	listen 80 default_server;
	#server_name www.test_app.com;	
	server_name _;
	passenger_enabled on; 
	root /var/www/test_app/public;
	# passenger_ruby
	# passenger_ruby /usr/local/rvm/wrappers/ruby-2.5.1/ruby;	
}

# OLD server config
server {
	listen 80;
	server_name www.cvm.com;
	
	# Turn on Passenger
	passenger_enabled on;

	# Tell Nginx and Passenger where your app's 'public' directory is
	root /var/www/cvm/code/public;
	index index.html index.htm index.html.erb;

	# Static assets are served from the mentioned root directory
	location / {
		#  root /var/www/cvm/current;
		#  index index.html index.htm;
		proxy_pass http://127.0.0.1:3000;

		proxy_redirect off;
		proxy_set_header X-Real-IP  $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header Host $http_host;
		# proxy_set_header X-Real-Port $server_port;
		# proxy_set_header X-Real-Scheme $scheme;
		proxy_set_header X-NginX-Proxy true;
	}

	# passenger_ruby
	passenger_ruby /usr/local/rvm/wrappers/ruby-2.5.1/ruby;
}