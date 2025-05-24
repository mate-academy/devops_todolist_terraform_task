variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "azurerm_virtual_machine" {
  type        = string
  description = "The name of azurerm_virtual_machine"
}

variable "azurerm_virtual_machine_size" {
  type        = string
  description = "The name of azurerm_virtual_machine"
}

variable "ssh_key_public" {
  description = "SSH key"
  type        = string
}

variable "username" {
  type        = string
  description = "The username VM"
  default     = "azureadmin"
}

variable "hostname" {
  type        = string
  description = "The hostname VM"
  default     = "hostname"
}

variable "storage_os_disk_name" {
  type        = string
  description = "The name of storage_os_disk"
  default     = "myosdisk"
}

variable "admin_username" {
  type        = string
  description = "The name of admin_username"
  default     = "testadmin"
}

variable "ssh_name" {
  type        = string
  description = "The name of ssh key"
  default     = "linuxboxsshkey"
}

variable "azurerm_virtual_machine_extension" {
  type        = string
  description = "The name of azurerm_virtual_machine_extension"
  default     = "install-app-script"
}

variable "subnet_id" {
  description = "ID of the subnet to attach NIC"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP to attach to NIC"
  type        = string
}