#! /bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1>Deployed via Terraform by Zinchenko</h1>" | sudo tee /var/www/html/index.html
