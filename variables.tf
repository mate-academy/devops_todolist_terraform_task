variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
}

variable "public_ip_address_name" {
  description = "The name of the public IP address"
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP address"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "The public SSH key for the virtual machine"
  type        = string
}

variable "extension_name" {
  description = "The name of the VM extension"
  type        = string
}
