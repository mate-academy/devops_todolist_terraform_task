variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address prefix for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Name of the network security group."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Name of the public IP address."
  type        = string
  default     = "linuxboxpip"
}

variable "dns_label" {
  description = "DNS label prefix for the public IP."
  type        = string
  default     = "matetask"
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "Size of the virtual machine."
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "SSH public key content for the virtual machine."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique storage account name."
  type        = string
  default     = "petliukmatetask12sa"
}
