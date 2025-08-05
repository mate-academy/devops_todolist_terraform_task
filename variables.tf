variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefixes for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "The SSH public key for the virtual machine"
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP"
  type        = string
  default     = "matetask8712"
}

variable "admin_username" {
  description = "The administrator username for the virtual machine"
  type        = string
  default     = "azureuser"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "limbxtodoliststorage"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "tfstate"
}