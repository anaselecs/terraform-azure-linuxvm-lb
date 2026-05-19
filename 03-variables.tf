 variable "resource_group_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}
variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "location_short" {
  type = string
}
variable "Vnet_address_space" {
  type = list(string)
}
variable "Vnet_name" {
type = string
  
}
variable "web_subnet_name" {
  type = string
}
variable "web_subnet_address_prefixes" {
  type = list(string)
}
variable "vm_size" {
  description = "Size of the Linux virtual machine"
  type        = string
}
variable "admin_username" {
  description = "Admin username for the Linux VM"
  type        = string
}