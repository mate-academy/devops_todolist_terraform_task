variable "resource_group_name" {
  description = "Resource group name for all resources."
  type        = string
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address space for the virtual network."
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the network security group."
  type        = string
}

variable "public_ip_address_name" {
  description = "Name of the public IP resource."
  type        = string
}

variable "dns_label" {
  description = "DNS label prefix for the public IP."
  type        = string
}
