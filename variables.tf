variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The name of the location"
}

variable "azurerm_virtual_network" {
  type        = string
  description = "The name of azurerm_virtual_network"
}

variable "vnet_address_prefix" {
  type        = string
  description = "The address prefix of the virtual network"
}

variable "azurerm_subnet" {
  type        = string
  description = "The name of azurerm_subnet"
}

variable "azurerm_subnet_address_prefix" {
  type        = string
  description = "The address prefix of the subnet"
}

variable "azurerm_network_security_group" {
  type        = string
  description = "The name of azurerm_network_security_group"
}

variable "azurerm_public_ip" {
  type        = string
  description = "The name of azurerm_public_ip"
}

variable "azurerm_virtual_machine" {
  type        = string
  description = "The name of azurerm_virtual_machine"
}

variable "azurerm_virtual_machine_size" {
  type        = string
  description = "The name of azurerm_virtual_machine"
}

variable "ssh_key_public" {
  description = "The public SSH key to access the virtual machine"
  type        = string
}

variable "dns_label" {
  type        = string
  description = "The name of dns_label"
  default     = "matetask"
}
# variable "subnet_id" {
#   description = "ID of the subnet to attach NIC"
#   type        = string
# }

# variable "public_ip_id" {
#   description = "The Id of the public IP to attach NIC"
#   type        = string
# }

