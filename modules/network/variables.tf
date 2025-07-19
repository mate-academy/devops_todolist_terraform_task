variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = list(string)
}

variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "dns_label" {
  description = "DNS label for the public IP"
  type        = string
}