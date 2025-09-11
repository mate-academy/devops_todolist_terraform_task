variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address prefix for the VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Network Security Group name"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Public IP name"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "Public SSH key for authentication"
  type        = string
}

variable "dns_label" {
  description = "Base DNS label for the public IP (random integer will be appended)"
  type        = string
  default     = "matetask"
}
