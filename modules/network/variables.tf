variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}
variable "location" {
  description = "The Azure region for deployment."
  type        = string
}
variable "virtual_network_name" {
  description = "The name of the Virtual Network (vnet)."
  type        = string
}
variable "vnet_address_prefix" {
  description = "The address prefix for the VNet (e.g., 10.0.0.0/16)."
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet (default)."
  type        = string
}
variable "subnet_address_prefix" {
  description = "The address prefix for the subnet (e.g., 10.0.0.0/24)."
  type        = string
}
variable "network_security_group_name" {
  description = "The name of the NSG (defaultnsg)."
  type        = string
}
variable "public_ip_address_name" {
  description = "The name of the Public IP address (linuxboxpip)."
  type        = string
}
variable "dns_label" {
  description = "The DNS label for the Public IP (matetask + random)."
  type        = string
}