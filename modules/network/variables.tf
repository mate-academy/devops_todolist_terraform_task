variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The location of the resource group and its resources."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}


variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network."
  type        = string
}


variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}


variable "subnet_address_prefix" {
  description = "The address prefix for the subnet."
  type        = string
}


variable "network_security_group_name" {
  description = "The name of the network security group."
  type        = string
}


variable "public_ip_address_name" {
  description = "The name of the public IP address."
  type        = string
}


variable "dns_label" {
  description = "The label for the DNS name."
  type        = string
}
