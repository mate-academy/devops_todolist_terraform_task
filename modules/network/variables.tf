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
