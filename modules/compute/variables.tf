variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vm_name" {
  type        = string
  description = "Virtual Machine name"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "public_ip_id" {
  type        = string
  description = "Public IP ID"
}

variable "ssh_key_public" {
  type        = string
  description = "Public SSH Key"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
}

variable "storage_container_name" {
  type        = string
  description = "Storage Container name"
}