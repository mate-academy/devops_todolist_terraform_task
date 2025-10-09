variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet"
}

variable "virtual_network_address_prefix" {
  description = "Virtual network address prefix"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Network security group name"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Public IP address name"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "SSH public key content"
  type        = string
}

variable "dns_label" {
  description = "DNS label prefix"
  type        = string
  default     = "matetask"
}

variable "container_name" {
  description = "Storage container name"
  type        = string
  default     = "task-artifacts"
}
