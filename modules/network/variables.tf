variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "subnet_name" {
  type        = string
  description = "Name of the first subnet"
}

variable "vnet_address_prefix" {
  type        = list(string)
  description = "List of address spaces for the virtual network"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "List of address prefixes for the subnet"
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers for the virtual network"
}

variable "network_security_group_name" {
  type        = string
  description = "Name of the network security group"
}

variable "public_ip_address_name" {
  type        = string
  description = "Name of the public IP address"
}

variable "dns_label" {
  type        = string
  description = "DNS label for the public IP address"
}
