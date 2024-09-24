variable "location" {
  description = "The location where all resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain all the resources."
  type        = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "linuxboxsshkey" {
  description = "SSH key for the virtual machine."
  type = object({
    path     = string
    key_data = string
  })
}
