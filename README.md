# Azure Linux VM Infrastructure with Terraform

## Project Overview

This project deploys a complete Azure Linux web infrastructure using Terraform.

The infrastructure includes:

* Azure Resource Group
* Virtual Network
* Web Subnet
* Network Security Group (NSG)
* Linux Virtual Machine (RHEL 9)
* Azure Standard Load Balancer
* Public IP Address
* Load Balancer Inbound NAT Rule
* Apache Web Server
* Automated VM provisioning using Bash scripting

---

## Technologies Used

* Terraform
* Microsoft Azure
* AzureRM Provider
* Linux (RHEL 9)
* Apache HTTP Server
* Bash Scripting
* Git & GitHub

---

## Project Structure

```text id="jlwm5r"
01-versions.tf
02-providers.tf
03-variables.tf
04-locals.tf
05-random.tf

10-resource-group.tf
11-networking.tf
12-security.tf
13-compute.tf
14-loadbalancer.tf

99-outputs.tf

terraform.tfvars
README.md
.gitignore
```

---

## Infrastructure Architecture

```text id="9jlwm2"
Internet
    ↓
Azure Load Balancer
    ↓
Linux Virtual Machine
    ↓
Apache Web Server
```

---

## Features Implemented

* Professional Terraform file structure
* Dynamic naming convention using locals
* Common tagging strategy
* Virtual Network and Subnet configuration
* Network Security Group with dynamic inbound rules
* Azure Standard Load Balancer
* Inbound NAT Rule for SSH access
* Linux VM deployment with SSH authentication
* Automated Apache web server installation
* Custom startup script using Terraform custom_data

---

## Web Application Access

After deployment, users can access the web application through the Azure Load Balancer Public IP Address.

The Load Balancer forwards incoming HTTP traffic to the backend Linux Virtual Machine automatically.

Example:

```text id="jlwm5u"
User Browser
      ↓
Azure Load Balancer Public IP
      ↓
Linux Virtual Machine
      ↓
Apache Web Server
```

---

## SSH Access Through Load Balancer NAT Rule

This project configures an Azure Load Balancer Inbound NAT Rule for secure SSH access to the Linux Virtual Machine.

The NAT rule maps:

```text id="2qjlwm"
Load Balancer Public IP : 1022
                ↓
Linux VM SSH Port : 22
```

Example SSH connection:

```bash id="fjlwm8"
ssh -i identity adminuser@PUBLIC-IP -p 1022
```

Infrastructure flow:

```text id="2mjlwm"
Administrator
      ↓
Azure Load Balancer Public IP
      ↓ Port 1022
Inbound NAT Rule
      ↓ Port 22
Linux Virtual Machine
```

---

## Linux VM Startup Script

The Linux VM is automatically configured during deployment using a Bash startup script.

The script performs the following actions:

* Installs Apache HTTP Server
* Starts and enables Apache service
* Disables firewall for demo purposes
* Creates web pages and subdirectories
* Displays VM hostname dynamically

---

## Web Pages

The project creates multiple web pages:

| Page      | Description             |
| --------- | ----------------------- |
| `/`       | Main homepage           |
| `/about`  | About project page      |
| `/status` | Application status page |

---

## Prerequisites

Before running this project, ensure you have:

* Terraform installed
* Azure CLI installed
* Azure subscription
* SSH key pair generated
* Git installed

---

## Azure Authentication

Login to Azure using Azure CLI:

```bash id="jlwm3f"
az login
```

---

## Initialize Terraform

```bash id="jlwm6q"
terraform init
```

---

## Validate Terraform Configuration

```bash id="6hjlwm"
terraform validate
```

---

## Review Terraform Execution Plan

```bash id="8hjlwm"
terraform plan
```

---

## Deploy Infrastructure

```bash id="9vjlwm"
terraform apply
```

---

## Destroy Infrastructure

```bash id="7bjlwm"
terraform destroy
```

---

## Security Notes

The following files are excluded using `.gitignore`:

* Terraform state files
* Private SSH keys
* Sensitive variable files
* Temporary Terraform files

Only the SSH public key is stored in the repository.

---

## Future Improvements

Planned future improvements include:

* Remote Terraform backend using Azure Storage Account
* Azure DevOps CI/CD pipeline
* Terraform modules
* Multiple environments (dev/prod)
* Azure Key Vault integration
* GitHub Actions automation

---

## Author

Anas
