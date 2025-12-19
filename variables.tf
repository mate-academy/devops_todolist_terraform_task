variable "location" {
  type        = string
  description = "Azure location"
  default     = "uksouth"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  type        = string
  description = "VNet name"
  default     = "vnet"
}

variable "vnet_address_prefix" {
  type        = string
  description = "VNet CIDR"
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
  default     = "default"
}

variable "subnet_address_prefix" {
  type        = string
  description = "Subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type        = string
  description = "NSG name"
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  type        = string
  description = "Public IP name"
  default     = "linuxboxpip"
}

variable "vm_name" {
  type        = string
  description = "VM name"
  default     = "matebox"
}

variable "vm_size" {
  type        = string
  description = "VM size"
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  type        = string
  description = "Public SSH key content (ssh-rsa/ssh-ed25519...)"
}

variable "dns_label" {
  type        = string
  description = "DNS label prefix for Public IP"
  default     = "matetask"
}

variable "tags" {
  type    = map(string)
  default = {}
}
