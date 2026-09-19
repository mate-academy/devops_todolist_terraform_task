variable "location" {
  description = "Azure region for compute resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine."
  type        = string
}

variable "ssh_key_public" {
  description = "SSH public key content."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the NIC."
  type        = string
}

variable "public_ip_id" {
  description = "ID of the public IP for the NIC."
  type        = string
}

variable "nsg_id" {
  description = "ID of the network security group."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine."
  type        = string
  default     = "azureuser"
}
