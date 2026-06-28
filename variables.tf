variable "location" {
  type        = string
  description = "The location of VM"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "vnet_address_prefix" {
  type        = string
  description = "The vnet address prefix"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "subnet_address_prefix" {
  type        = string
  description = "The subnet address prefix"
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the network security group"
}

variable "public_ip_address_name" {
  type        = string
  description = "The name of the public ip address"
}

variable "vm_name" {
  type        = string
  description = "The name of the VM"
}

variable "vm_size" {
  type        = string
  description = "The size of the VM"
}

variable "ssh_key_public" {
  type        = string
  description = "The content of the public ssh key"
}

variable "dns_label" {
  type        = string
  description = "The dns label"
}
