variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_address_prefix" {
  description = "VNet address space"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix"
  type        = string
}

variable "network_security_group_name" {
  description = "NSG name"
  type        = string
}

variable "public_ip_address_name" {
  description = "Public IP name"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
}

variable "ssh_key_public" {
  description = "SSH public key"
  type        = string
}

variable "dns_label" {
  description = "DNS label"
  type        = string
}
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}
variable "storage_container_name" {
  description = "Name of the storage container"
  type        = string
}