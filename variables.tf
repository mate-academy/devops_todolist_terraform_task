variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "5e6cbf5b-0850-48e8-aedc-be0e71fb3978"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralindia"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address prefix for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Name of the public IP address"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "SSH public key content for the virtual machine"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHlH798Gbwfe2AhnXNK123VDP1W7+uG7G4T7t3P6qSWo kenu21@gmail.com"
}

variable "dns_label" {
  description = "DNS label prefix for the public IP (you can append a random number in your script)"
  type        = string
  default     = "matetask"
}

variable "storage_account_name" {
  description = "Name of the storage account (3-24 chars, lowercase alphanumeric only, must be globally unique)"
  type        = string
  default     = "yuriikeniustorage2"
}

variable "container_name" {
  description = "Name of the storage container within the storage account"
  type        = string
  default     = "task-artifacts"
}

variable "install_app_script_path" {
  description = "Path to the install-app.sh script file"
  type        = string
  default     = "./install-app.sh"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
}
