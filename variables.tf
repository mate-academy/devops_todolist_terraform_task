variable "location" {
  description = "The location of the resources"
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

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "Content of the public SSH key"
  type        = string
}

variable "ssh_key_private" {
  description = "Path to the private SSH key"
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP address"
  type        = string
}

variable "admin_username" {
  description = "The administrative username for the virtual machine"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}
