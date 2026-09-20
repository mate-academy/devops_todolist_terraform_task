variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region for the resources"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_prefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type    = string
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  type    = string
  default = "linuxboxpip"
}

variable "dns_label" {
  type    = string
  default = "matetask"
}