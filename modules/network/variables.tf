variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the network resources."
}

variable "location" {
  type        = string
  description = "The Azure region in which to create the network resources."
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
}

variable "vnet_address_prefix" {
  type        = string
  description = "The address prefix for the virtual network."
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet."
}

variable "subnet_address_prefix" {
  type        = string
  description = "The address prefix for the subnet."
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the network security group."
}

variable "public_ip_address_name" {
  type        = string
  description = "The name of the public IP address."
}

variable "dns_label" {
  type        = string
  description = "The DNS label prefix for the public IP address."
}

variable "security_rules" {
  description = "A list of security rules to configure on the network security group."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}
