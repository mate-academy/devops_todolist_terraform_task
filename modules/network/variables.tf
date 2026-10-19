variable "resource_group_name" {
  description = "Name of the resource group for the network resources"
  type        = string
}

variable "location" {
  description = "Azure region (e.g. westeurope)"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address space of the virtual network in CIDR format (e.g. 10.0.0.0/16)"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address range of the subnet in CIDR format (e.g. 10.0.0.0/24)"
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the network security group (NSG)"
  type        = string
}

variable "public_ip_address_name" {
  description = "Name of the public IP resource"
  type        = string
}

variable "dns_label" {
  description = "DNS label prefix for the public IP (a random number is appended)"
  type        = string
}
