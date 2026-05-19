#!/bin/bash

# Install Apache
sudo yum install -y httpd

# Enable and start Apache
sudo systemctl enable httpd
sudo systemctl start httpd

# Disable firewall for demo purposes
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Create subdirectories
sudo mkdir -p /var/www/html/about
sudo mkdir -p /var/www/html/status

# Main Homepage
cat <<EOF | sudo tee /var/www/html/index.html

<!DOCTYPE html>
<html>

<head>
    <title>Anas Cloud Project</title>
</head>

<body>

    <h1>Welcome to Anas Cloud Project</h1>

    <p>This VM was deployed using Terraform on Azure.</p>

    <p><strong>Hostname:</strong> $(hostname)</p>

    <h3>Pages</h3>

    <a href="/about">About Page</a><br><br>

    <a href="/status">Status Page</a>

</body>

</html>

EOF

# About Page
cat <<EOF | sudo tee /var/www/html/about/index.html

<!DOCTYPE html>
<html>

<head>
    <title>About</title>
</head>

<body>

    <h1>About This Project</h1>

    <p>Built by Anas using Terraform and Microsoft Azure.</p>

</body>

</html>

EOF

# Status Page
cat <<EOF | sudo tee /var/www/html/status/index.html

<!DOCTYPE html>
<html>

<head>
    <title>Status</title>
</head>

<body>

    <h1>Application Status</h1>

    <p>Status: Running</p>

    <p>Hostname: $(hostname)</p>

</body>

</html>

EOF