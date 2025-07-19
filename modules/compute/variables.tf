variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string

}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the VM will be created"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address associated with the VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "The public SSH key for the VM"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}