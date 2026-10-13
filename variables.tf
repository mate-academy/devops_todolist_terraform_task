variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "mate-azure-task-12"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "Denmark East"
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address space VNet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "subnet address prefix"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "network security group name"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Public IP name"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "Size of virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "path to SSH key"
  type        = string
}

variable "dns_label" {
  description = "dns label"
  type        = string
}