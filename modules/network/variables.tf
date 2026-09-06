variable "azurerm_virtual_network_name" {
  default     = "vnet"
}

variable "subnet_name" {
  default     = "default"
}

variable "network_security_group_name" {
  default     = "defaultnsg"
}

variable "public_ip_name" {
  default     = "linuxboxpip"
}

variable "dns_label" {
  default = "matetask"
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}