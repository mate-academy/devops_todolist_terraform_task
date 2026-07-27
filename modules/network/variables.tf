variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "vnet_address_prefix" {
  type        = string
  description = "VNet address prefix"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Subnet address prefix"
}

variable "nsg_name" {
  type        = string
  description = "NSG name"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name"
}

variable "dns_label_prefix" {
  type        = string
  description = "DNS prefix for public IP"
}