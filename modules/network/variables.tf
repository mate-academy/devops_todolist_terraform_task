variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
variable "azurerm_virtual_network" {
  type        = string
  description = "The name of azurerm_virtual_network"
}

variable "azurerm_network_security_group" {
  type        = string
  description = "The name of azurerm_network_security_group"
}

variable "azurerm_subnet" {
  type        = string
  description = "The name of azurerm_subnet"
  default     = "default"
}

variable "azurerm_public_ip" {
  type        = string
  description = "The name of azurerm_public_ip"
}

variable "dns_label" {
  type        = string
  description = "The name of dns_label"
}

variable "vnet_address_prefix" {
  type        = string
  description = "The address prefix of the virtual network"
}

variable "azurerm_subnet_address_prefix" {
  type        = string
  description = "The address prefix of the subnet"
}