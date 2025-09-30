variable "location" {
  description = "The location where resources will be created"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

# Network
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "network_security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP"
  type        = string
  default     = "linuxboxpip"
}

variable "dns_label" {
  description = "The DNS label for the public IP"
  type        = string
  default     = "matetask"
}

# Compute
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
  description = "The public SSH key for the virtual machine"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# Storage
variable "storage_account_name" {
  description = "The name of the storage account (must be lowercase, 3–24 chars)"
  type        = string
  default     = "electicwizard2345542356"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "task-artifacts"
}

variable "blob_name" {
  description = "The name of the storage blob"
  type        = string
  default     = "blob"

}