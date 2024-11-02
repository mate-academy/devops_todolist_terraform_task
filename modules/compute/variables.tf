variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP address."
  type        = string
}

variable "ssh_key" {
  description = "The SSH public key for authentication."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where resources will be created."
  type        = string
}
