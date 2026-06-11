variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
  default     = "mate-azure-task-12"
}

variable "location" {
  description = "The Azure region in which to create the resources."
  type        = string
  default     = "uksouth"
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "The name of the network security group."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address."
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "The public SSH key content."
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP."
  type        = string
  default     = "matetask"
}