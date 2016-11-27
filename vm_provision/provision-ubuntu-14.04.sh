#!/usr/bin/env bash

# Intended for Ubuntu 14.04 (Trusty)

# Update Ubuntu
apt-get update

# Adjust timezone to be Phoenix
ln -sf /usr/share/zoneinfo/Africa/Nairobi /etc/localtime

# Apache
echo "----- Provision: Installing apache..."
apt-get install -y apache2 apache2-utils
echo "ServerName localhost" > "/etc/apache2/conf-available/fqdn.conf"
a2enconf fqdn
a2enmod rewrite
a2dissite 000-default.conf

echo "----- Provision: Setup /var/www to point to /vagrant ..."
rm -rf /var/www
ln -fs /vagrant /var/www

# Apache / Virtual Host Setup
echo "----- Provision: Install Host File..."
cp /vagrant/vm_provision/hostfile /etc/apache2/sites-available/project.conf
a2ensite project.conf

# Add Python 2.7 to machine
echo "----- Provision: Installing Python 2.7..."
apt-get install -y python2.7

# Add python-pip
echo "----- Provision: Installing Python 2.7..."
apt-get -y install python-pip

# Add virtualenv
echo "----- Provision: Installing Virtualenv..."
pip install virtualenv

# Add Postgres


# Cleanup
apt-get -y autoremove

# Restart Apache
echo "----- Provision: Restarting Apache..."
service apache2 restart
