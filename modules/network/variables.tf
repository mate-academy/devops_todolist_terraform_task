variable "vnet_address_prefix" {
  description = "Address prefix of the virtual network"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
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

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "public_ip_address_name" {
  description = "pip address name"
  type        = string
}
variable "dns_label" {
  description = "dns label"
  type        = string
}