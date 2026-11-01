variable "location" {
  type    = string
  default = "uksouth"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "backend_storage_account_name" {
  type    = string
  default = "tfstatestorageacc2026"
}

variable "backend_storage_container_name" {
  type    = string
  default = "tfstate"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_prefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type    = string
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  type    = string
  default = "linuxboxpip"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "ssh_key_public" {
  type        = string
  description = "Public SSH key content"
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM4r/fW5JuYeVI7KVtaxQkLizgp9NUf8/w0QBu7wvSQG nicho@DESKTOP-S6BL84A"
}

variable "dns_label" {
  type    = string
  default = "matetask"
}