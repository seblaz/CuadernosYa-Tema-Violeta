#!/bin/bash

if [ $# -gt 1 ] ;then
    echo "Usage: [optional (default: 1.7.6.2)] <release version>"
    exit 1
fi

if [ -f "/var/www/html/INSTALL.txt" ]; then
    echo "Prestashop already installed. If you want to reinstall it clean the /var/www/html directory."
    exit 1
fi

# Check PHP installation.
php --version > /dev/null
if [ $? != 0 ]; then
    echo "PHP not installed."
    exit 1
fi

# Check Apache2 installation.
if [ "$(systemctl is-active apache2)" == "active"  ]; then
    echo "Apache2 is active."
else
    echo "Apache2 is inactivate, please install it or start it."
    exit 1
fi

# Check MySQL installation
mysql --version > /dev/null
if [ $? != 0 ]; then
    echo "MySQL not installed, please install it and run again."
    exit 1
else
    echo "MySQL installed."
fi

# Install required modules
sudo apt-get install php7.2-gd
sudo apt-get install php-curl
sudo apt-get install php-xml
sudo apt-get install php7.2-mysql
sudo apt-get install php7.2-intl
sudo apt-get install php7.2-mbstring
sudo a2enmod rewrite
sudo systemctl restart apache2

# Download Prestashop installation files.
VERSION="${1:-1.7.6.2}"
PRESTASHOP_FILE="/tmp/prestashop.zip"
DOWNLOAD_PATH="https://download.prestashop.com/download/releases/prestashop_$VERSION.zip"
INSTALLATION_PATH="/var/www/html"

if [ -f "$PRESTASHOP_FILE" ]; then
    echo "Installation file found: $PRESTASHOP_FILE."
else
    curl --fail --progress-bar -L "$DOWNLOAD_PATH" > "$PRESTASHOP_FILE"
    if [ $? != 0 ]; then
        echo "Couldn't find $DOWNLOAD_PATH."
        exit 1
    fi
    echo "Prestashop installation file downloaded to $PRESTASHOP_FILE."
fi

# Check unzip installation and unzip.
which unzip > /dev/null
if [ $? != 0 ]; then
    echo "unzip not installed, going to install it."
    sudo apt install unzip
else
    echo "unzip already installed."
fi

if [ ! -d "/tmp/prestashop" ]; then
    unzip -q "$PRESTASHOP_FILE" -d "/tmp/prestashop"
fi
unzip -q "/tmp/prestashop/prestashop.zip" -d "$INSTALLATION_PATH"

echo "Prestashop installation files extracted."

# Download theme
git clone git@github.com:seblaz/CuadernosYa-Tema-Violeta.git "/var/www/html/themes/violeta"
if [ $? != 0 ]; then
    echo "Couldn't download theme, please be sure to have sufficient permissions."
    exit 1
else
    echo "Theme downloaded."
fi

# Create database prestashop
echo "Installing Prestashop..."
php /var/www/html/install/index_cli.php --domain=localhost --db_server=localhost --db_name=prestashop --db_user=root --db_password="" --step=all --language=es --db_create=1 --country=ar --email=pub@prestashop.com --password=0123456789 --newsletter=0 --theme=classic

echo "Prestashop installed with user: pub@prestashop.com and password 0123456789."

chmod -R 777 /var/www/html/*

rm -R "/var/www/html/install"
