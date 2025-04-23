variable "virtual_network_name" {
  default = "vnet"
}

variable "vn_address_prefix" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "default"
}

variable "sub_address_prefix" {
  default = "10.0.0.0/24"
}

variable "virtual_security_group_name" {
  default = "defaultnsg"
}

variable "ip_address_name" {
  default = "linuxboxpip"
}

variable "dns_name" {
  default = "matetask"
}

variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
}