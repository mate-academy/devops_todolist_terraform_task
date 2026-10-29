variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "matebox"
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
  default     = "resource-group"
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address."
  type        = string
}

variable "linuxboxsshkey" {
  description = "The SSH key for the Linux virtual machine."
  type        = string
}