variable "resource_group_name" {
  type        = string
  default     = "mate-azure-task-12"
  description = "Name of your resource group"
}

variable "location" {
  type        = string
  default     = "uksouth"
  description = "location for all resources"
}

variable "ssh_key_public" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to your public ssh key on local machine"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Virtual Machine Size"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin Username"
}

variable "storage_account_name" {
  type        = string
  default     = "defaultstaccn"
  description = "name of your storage account"
}

variable "dns_label" {
  type    = string
  default = "matetask"
}

variable "dns_custom_label" {
  type    = string
  default = null
}

variable "vnet_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_space" {
  type = list(string)
  default = [
    "10.0.0.0/16"
  ]
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

variable "dns_label_prefix" {
  type    = string
  default = "matetask"
}