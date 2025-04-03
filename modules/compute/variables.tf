variable "vm_name" {
  type = string
}

variable "location" {
  description = "The location of the public IP"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vm_size" {
  description = "Size of the Azure VM"
  type        = string
  default     = "Standard_B1s"

  validation {
    condition     = contains(["Standard_B1s", "Standard_B2s", "Standard_B4ms"], var.vm_size)
    error_message = "Unacceptable virtual machine size. Available options: Standard_B1s, Standard_B2s, Standard_B4ms."
  }
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "ssh_key_public" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/linuxboxsshkey.pub"
}

variable "ssh_key_private" {
  description = "SSH private key"
  type        = string
  default     = "~/.ssh/linuxboxsshkey"
}

variable "os_disk_type" {
  description = "Type of the OS disk (Standard_LRS, Premium_LRS)"
  type        = string
  default     = "Standard_LRS"
}

variable "ubuntu_version" {
  description = "Ubuntu version for the VM"
  type        = string
  default     = "latest"
}

variable "subnet_id" {
  description = "Subnet for virtual machine"
  type        = string
}

variable "public_ip_address_id" {
  type = string
}

variable "public_ip_dns" {
  type = string
}
