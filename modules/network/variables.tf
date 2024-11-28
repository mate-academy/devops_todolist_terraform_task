variable "location" {
  description = "The location where resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "dns_label_prefix" {
  description = "The prefix for the DNS label."
  type        = string
  default     = "matetask"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network"
  type        = string
}
