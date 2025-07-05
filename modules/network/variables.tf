variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "random_num" {
  type = number
}

variable "public_ip_name" {
  type = string
}

variable "net_security_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_pref" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "address_prefix" {
  type = list(string)
}

variable "dns_label" {
  type = string
}

