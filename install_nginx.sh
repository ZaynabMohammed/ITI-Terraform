#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo chown -R ubuntu:ubuntu /var/www/html/
sudo chmod o+w /var/www/html/index.nginx-debian.html
echo "<h1>Hello World!! from $(hostname -f)</h1>" | sudo tee /var/www/html/index.nginx-debian.html

