# TripNest Teaser ReadMe.md
## Getting Started
### Setting the development environment on Ubuntu 14.04
From: https://gorails.com/setup/ubuntu/14.04
Install dependencies for Ruby
```
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev

```
Install `rvm`, a Ruby Version Manager see: https://rvm.io/
```
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.5
rvm use 2.1.5 --default
ruby -v
```
Tell RubyGems not to install documentation for each package locally.
```
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
```

### Configuring Git
Replace Git details with your information
```
git config --global color.ui true
git config --global user.name "First Last"
git config --global user.email "[YOUR EMAIL ADDRESS]"
ssh-keygen -t rsa -C "[YOUR EMAIL ADDRESS]"
```
Copy and paste your newly generated SSH key and add it to GitHub.
```
cat ~/.ssh/id_rsa.pub
```
Test if you've properly added your generated SSH key.
```
ssh -T git@github.com
```
### Installing Rails
Add NodeJS (for dependent libraries, if you don't the running `rails server` may cause errors)
```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```
Install Rails
```
gem install rails
```
Profit.
### Setting up PostgreSQL
Install PostgreSQL
```
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.3 libpq-dev
```
Grant proper access to users (note in PostgreSQL, 'users' are called 'roles')
```
sudo -u postgres psql
postgres=#  create role teaserdb_dev with createdb login password 'teaser1122';
CREATE ROLE
postgres=#  create role teaserdb_test with createdb login password 'teaser_test';
CREATE ROLE
```
### Final Steps
Clone the GitHub Repository
```
git clone git@github.com:nwpan/tripnest_teaser.git
```
Change directory to the project's repository.
```
cd tripnest_teaser
```
Run bundler, a Ruby Application's Manager for gems
```
bundle install
```
Create and setup the development & test database
```
rake db:setup
rake db:setup RAILS_ENV=test
```
Run the server
```
rails server
```
Go to the hosted server path in your preferred browser
```
http://localhost:3000/
```
