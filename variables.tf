variable "location" {
  description = "The Azure region where the resources will be created"
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
  description = "The address prefix for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address"
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
  description = "The public SSH key for the virtual machine"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb4Yoa3tEpy92WT0u963xnKfE5j1gbBwmFnNWAGIwIQacyXCnBIhUOM+IWO2NnF7Qf9c0uby6+ymgXms7G/sQRMNBFPP10+qZ6ZFXpjT/JPnfxalMeRahhCQXWGXj1jiyZWcF4LE5As1burd5korO8CmprbkhjYqJhmj5ONpk7ldZeKDS3Q8gYZ6+M1tqcY1rVQ3fKuvDXs8JMCLWeHSm+xi8qsqt5kjs18y5lpZPDDwbcjbMKUgsJHqasz5bgnnT9YBc+HzcI/B6DjbX2LgMHDPIVG5UyxdWFjRsVdtkRjfYMNBI2efJWUDCWhdMQ7/mUdfF+QKprD3ssBASVWd9/ ipppk@LAPTOP"
}

variable "dns_label" {
  description = "The DNS label for the public IP address"
  type        = string
  default     = "matetask"
}

variable "extension_name" {
  description = "The name of the VM extension"
  type        = string
  default     = "install_script"
}
