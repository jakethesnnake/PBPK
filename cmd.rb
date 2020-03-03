# admin privileges
sudo -i

# system
apt-get install zlib1g-dev
apt-get install libsqlite3-dev
apt install gnupg2

# gems
gem install rails
gem install bundler --version '2.0.2'
gem install rubygems-bundler

# keys
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BD

# rvm
curl -sSL https://get.rvm.io | bash -s stable # install RVM
rvm install "ruby-2.5.1"
rvm use 2.5.1 --default

# bundle
bundle install

# run tests
bundle exec rspec

# setup database
bundle exec rake db:drop db:create db:migrate db:seed