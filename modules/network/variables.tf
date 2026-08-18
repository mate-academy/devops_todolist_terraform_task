variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address space (CIDR) for the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet within the virtual network"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix (CIDR) for the subnet"
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
}

variable "public_ip_address_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "dns_label" {
  description = "Base string used to build the public IP's DNS label"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where all resources will be created"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}