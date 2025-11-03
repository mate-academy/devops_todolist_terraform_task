variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_prefix" {
  description = "Virtual network address prefix"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix"
  type        = string
}

variable "network_security_group_name" {
  description = "Network security group name"
  type        = string
}

variable "public_ip_address_name" {
  description = "Public IP address name"
  type        = string
}

variable "dns_label" {
  description = "DNS label prefix"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
