# variables.tf (Root file)

# 1. GENERAL VARIABLES
variable "location" {
  type        = string
  description = "Azure region for deployment (uksouth)."
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group (mate-azure-task-12)."
}

# 2. NETWORK VARIABLES
variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network (vnet)."
}
variable "vnet_address_prefix" {
  type        = string
  description = "VNet address space (10.0.0.0/16)."
}
variable "subnet_name" {
  type        = string
  description = "Name of the Subnet (default)."
}
variable "subnet_address_prefix" {
  type        = string
  description = "Subnet address prefix (10.0.0.0/24)."
}
variable "network_security_group_name" {
  type        = string
  description = "Name of the NSG (defaultnsg)."
}
variable "public_ip_address_name" {
  type        = string
  description = "Name of the Public IP address (linuxboxpip)."
}
variable "dns_label" {
  type        = string
  description = "Base DNS label for the Public IP (matetask)."
}

# 3. COMPUTE VARIABLES
variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine (matebox)."
}
variable "vm_size" {
  type        = string
  description = "Size of the VM (Standard_B1s)."
}
variable "admin_username" {
  type        = string
  default     = "azureuser" # Matches the user in install-app.sh
  description = "Admin username for the VM."
}
variable "ssh_key_public" {
  type        = string
  description = "The public SSH key content for VM access."
  sensitive   = true
}

# 4. STORAGE VARIABLES
variable "storage_account_name" {
  type        = string
  description = "Globally unique name for the Storage Account created by Terraform."
}
variable "storage_container_name" {
  type        = string
  default     = "task-artifacts"
  description = "Name of the storage container for scripts."
}