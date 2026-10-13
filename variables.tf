variable "subscription_id" {
  description = "Azure subscription ID used by the azurerm provider."
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "Virtual network name."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "CIDR block for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Subnet name."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "CIDR block for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "Network security group name."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Public IP resource name."
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "Linux virtual machine name."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "VM SKU."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for SSH access."
  type        = string
  default     = "azureuser"
}

variable "ssh_key_public" {
  description = "SSH public key content."
  type        = string
  default     = "ssh-rsa REPLACE_WITH_YOUR_PUBLIC_KEY"
}

variable "dns_label" {
  description = "Base DNS label for the public IP."
  type        = string
  default     = "matetask"
}

variable "storage_container_name" {
  description = "Storage container name for task artifacts."
  type        = string
  default     = "task-artifacts"
}

variable "script_url" {
  description = "Public raw URL to install-app.sh in your fork."
  type        = string
  default     = "https://raw.githubusercontent.com/<your-gh-username>/devops_todolist_terraform_task/main/install-app.sh"
}

variable "repository_url" {
  description = "Git URL of your fork used by install-app.sh."
  type        = string
  default     = "https://github.com/<your-gh-username>/devops_todolist_terraform_task.git"
}
