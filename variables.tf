variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "my_account_name" {
  description = "Name of the storage account"
  type        = string
}
variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}
variable "install_script_url" {
  description = "URL of install-app.sh"
  type        = string
}
variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}
variable "vnet_address_prefix" {
  description = "Address prefix of the virtual network"
  type        = string
}
variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
}
variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}
variable "subnet_address_prefix" {
  description = "Address prefix of the subnet"
  type        = string
}
variable "vm_size" {
  description = "vm size"
  type        = string
}
variable "public_ip_address_name" {
  description = "pip address name"
  type        = string
}
variable "ssh_key_public" {
  description = "Public SSH key content"
  type        = string
}
variable "dns_label" {
  description = "dns label"
  type        = string
}