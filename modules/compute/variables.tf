variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vm_name" {
  description = "Virtual machine name"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "Size of virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "username admin for Linux"
  type        = string
  default     = "adminuser"
}

variable "ssh_key_public" {
  description = "path to SSH key"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for network interface"
  type        = string
}

variable "public_ip" {
  description = "Public IP ID for network interface"
  type        = string
}