variable "location" {
  type        = string
  description = "value for the location of the resources"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "name of the virtual network"
}

variable "vnet_address_prefix" {
  type        = string
  description = "address prefix for the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "name of the subnet"
}

variable "subnet_address_prefix" {
  type        = string
  description = "address prefix for the subnet"
}

variable "network_security_group_name" {
  type        = string
  description = "name of the network security group"
}

variable "public_ip_address_name" {
  type        = string
  description = "name of the public IP address"
}

variable "vm_name" {
  type        = string
  description = "name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "size of the virtual machine"
}

variable "ssh_key_public" {
  type        = string
  description = "public SSH key for the virtual machine"
}

variable "dns_label" {
  type        = string
  description = "DNS label for the public IP address"
}
