### general

variable "location" {
  type        = string
  description = "The Azure region in which to create all resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
  default     = "mate-azure-task-12"
}

### network

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network."
  default     = "vnet"
}

variable "vnet_address_prefix" {
  type        = string
  description = "The address prefix for the virtual network."
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet."
  default     = "default"
}

variable "subnet_address_prefix" {
  type        = string
  description = "The address prefix for the subnet."
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the network security group."
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  type        = string
  description = "The name of the public IP address."
  default     = "linuxboxpip"
}

variable "dns_label" {
  type        = string
  description = "The DNS label prefix for the public IP address (a random number is appended)."
  default     = "matetask"
}

### compute

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine."
  default     = "matebox"
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  type        = string
  description = "The public SSH key content to be used for the virtual machine."
}

variable "install_script_url" {
  type        = string
  description = "The URL of the script to be executed by the custom script extension."
}
