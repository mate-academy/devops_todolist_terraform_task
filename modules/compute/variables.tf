variable "subnet_id" {
  description = "ID of the subnet for the VM's network interface"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the Public IP assigned to the VM's network interface"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "admin_ssh_key" {
  description = "SSH public key for the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name where install-app.sh script is stored"
  type        = string
}

variable "storage_account_key" {
  description = "Storage account key for accessing the script"
  type        = string
}

variable "container_name" {
  description = "Container name where install-app.sh script is stored"
  type        = string
}
