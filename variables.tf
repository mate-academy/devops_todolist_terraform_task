variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "The location where the resources will be created"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account"
}

variable "container_name" {
  type        = string
  description = "The name of the storage container within the storage account"
}

variable "security_group_name" {
  type        = string
  description = "The name of the network security group"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet within the virtual network"
}

variable "public_ip_name" {
  type        = string
  description = "The name of the public IP address"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "extension_name" {
  type        = string
  description = "The name of the virtual machine extension"
}

variable "domain_name_label" {
  type        = string
  description = "The label for the domain name of the public IP address"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine (e.g., Standard_B2s)"
}

variable "vnet_address" {
  type        = string
  description = "The address space for the virtual network (e.g., 10.0.0.0/16)"
}

variable "subnet_address_prefix" {
  type        = string
  description = "The address prefix for the subnet (e.g., 10.0.1.0/24)"
}

variable "admin_username" {
  type        = string
  description = "The username for the administrator of the virtual machine"
}

variable "admin_password" {
  type        = string
  description = "The password for the administrator of the virtual machine"
}

variable "key_data" {
  type        = string
  description = "The SSH public key for the administrator"
}
