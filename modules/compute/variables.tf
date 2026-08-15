variable "vm_name" {
    type        = string
    description = "Name of the virtual machine"
}

variable "subnet_id" {
    type        = string
    description = "ID of the subnet"
}

variable "public_ip_id" {
    type        = string
    description = "ID of the public IP address"
}

variable "public_ip_address" {
    type        = string
    description = "Public IP address"
}

variable "location" {
    type        = string
    description = "Location of the resource group"
}

variable "resource_group_name" {
    type        = string
    description = "Name of the resource group"
}

variable "install_script_url" {
    type        = string
    description = "URL of the installation script"
}

variable "ssh_key_public" {
  type        = string
  description = "Collection of public SSH keys for the admin user"
}

variable "os_disk_caching" {
  type        = string
  description = "Type of caching for the OS disk"
  default     = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type        = string
  description = "Type of storage account for the OS disk"
  default     = "Standard_LRS"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
  default     = "Standard_B1s"
}

variable "admin_username" {
  type        = string
  description = "Username for the admin user"
  default     = "azureuser"
}
