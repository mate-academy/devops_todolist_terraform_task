variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "network_name" {
  description = "The name of the network"
  default     = "vnet"
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  default     = ["10.0.0.0/16"]
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = "default"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  default     = ["10.0.0.0/24"]
  type        = list(string)
}

variable "nsg_name" {
  description = "The name of the Network Security Group"
  default     = "defaultnsg"
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP"
  default     = "linuxboxpip"
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the public IP"
  type        = string
}
