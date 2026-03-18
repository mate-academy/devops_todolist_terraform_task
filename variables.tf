variable "location" {
  type        = string
  description = "Location for the resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "vnet_address_prefix" {
  type        = string
  description = "Address prefix for the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the virtual network subnet"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Address prefix for the virtual network subnet"
}

variable "network_security_group_name" {
  type        = string
  description = "name of the network security group"
}

variable "public_ip_address_name" {
  type        = string
  description = "Name of the public ip address"
}

variable "dns_label" {
  type        = string
  description = "Static part of DNS label"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
}

variable "vm_publisher" {
  type        = string
  description = "Publisher of the virtual machine image"
}

variable "vm_offer" {
  type        = string
  description = "Offer of the virtual machine image"
}

variable "vm_sku" {
  type        = string
  description = "SKU of the virtual machine image"
}

variable "vm_version" {
  type        = string
  description = "Version of the virtual machine image"
}

variable "admin_username" {
  type        = string
  description = "Username of the virtual machine admin user"
}

variable "ssh_key_path" {
  type        = string
  description = "Path to the local ssh key"
}
