variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
}

variable "vnet_name" {
  default = "vnet"
}

variable "vnet_address_prefix" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefix" {
  default = "10.0.0.0/24"
}

variable "nsg_name" {
  default = "defaultnsg"
}

variable "public_ip_name" {
  default = "linuxboxpip"
}

variable "ssh_key_public" {
  type = string
}

variable "dns_label" {
  default = "matetask"
}

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "storage_account_name" {
  default = "alina18storageaccount18"
}

variable "container_name" {
  default = "tfstate"
}