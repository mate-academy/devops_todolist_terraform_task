variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "matebox"
}

variable "location" {
  type        = string
  description = "Azure region where compute resources will be created"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
  default     = "Standard_B1s"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the network interface will be connected"
}

variable "linuxboxsshkey" {
  type        = string
  description = "Public SSH key for virtual machine access"
}

variable "public_ip_id" {
  type        = string
  description = "ID of the public IP address"
}

variable "nsg_id" {
  type        = string
  description = "ID of the network security group"
}