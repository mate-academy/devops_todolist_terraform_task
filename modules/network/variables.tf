

variable "public_ip_address_name" {
  description = ""
  type        = string
}

variable "public_ip_allocation_method" {
  description = ""
  type        = string
}

variable "virtual_network_name" {
  description = ""
  type        = string
}

variable "subnet_name" {
  description = ""
  type        = string
}

variable "network_security_group_name" {
  description = ""
  type        = string
}


variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_address_prefix" {
  type = string
}

variable "subnet_address_prefix" {
  type = string
}