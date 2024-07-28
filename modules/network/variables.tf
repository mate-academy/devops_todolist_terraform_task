variable "security_group_name" {
  type        = string
  description = "The name of the network security group"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet within the virtual network"
}

variable "public_ip_name" {
  type        = string
  description = "The name of the public IP address"
}

variable "rg_name" {
  type        = string
  description = "The name of the resource group"
}

variable "rg_location" {
  type        = string
  description = "The location of the resource group"
}

variable "domain_name_label" {
  type        = string
  description = "The label for the domain name of the public IP address"
}

variable "vnet_address" {
  type        = string
  description = "The address space for the virtual network (e.g., 10.0.0.0/16)"
}

variable "subnet_address_prefix" {
  type        = string
  description = "The address prefix for the subnet (e.g., 10.0.1.0/24)"
}
