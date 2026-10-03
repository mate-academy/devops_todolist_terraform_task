variable "resource_group_name" {
  description = "The name of the resource group in which to create the network resources."
  type        = string

}

variable "location" {
  description = "The Azure region in which to create the network resources."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to create."
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet to create."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet."
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group to create."
  type        = string
}

variable "public_ip_address_name" {
  description = "The name of the public IP address to create."
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP address."
  type        = string
}

