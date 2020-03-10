#!/bin/bash
# box_configuration.sh

  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:ondrej/php
  sudo add-apt-repository ppa:ondrej/apache2
  sudo apt-get update
  sudo apt-get upgrade
  sudo apt-get install -y php7.3
  sudo systemctl restart apache2
