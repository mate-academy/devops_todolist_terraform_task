variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  default = "vnet"
}

variable "vnet_address_prefix" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefix" {
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  default = "linuxboxpip"
}

variable "dns_label" {
  default = "matetask"
}
