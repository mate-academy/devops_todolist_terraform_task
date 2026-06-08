variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address space for virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Subnet prefix"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Network security group name"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Public IP resource name"
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
  description = "Public SSH key content"
  type        = string
}

variable "dns_label" {
  description = "DNS label prefix for public IP"
  type        = string
  default     = "matetask"
}

variable "storage_account_name_prefix" {
  description = "Storage account name prefix (3-16 lowercase alphanumeric chars)"
  type        = string
  default     = "matetasksa"
}

variable "storage_container_name" {
  description = "Storage container name"
  type        = string
  default     = "task-artifacts"
}

variable "repository_url" {
  description = "HTTPS URL of the forked repository to clone on VM"
  type        = string
}
