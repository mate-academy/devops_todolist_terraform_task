variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the resources."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine to create."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine to create."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the virtual machine belongs."
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the network security group to associate with the virtual machine."
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP address to associate with the virtual machine."
  type        = string
}

variable "ssh_key_public" {
  description = "The public SSH key to use for the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "The username for the administrator account on the virtual machine."
  type        = string
}
