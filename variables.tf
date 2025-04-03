variable "location" {
  type        = string
  default     = "uksouth"
  description = "The Azure region where resources will be created, e.g., 'uksouth'."
}

variable "resource_group_name" {
  type        = string
  default     = "mate-azure-task-12"
  description = "The name of the Azure resource group where the resources will be deployed."
}

variable "virtual_network_name" {
  type        = string
  default     = "vnet"
  description = "The name of the virtual network that will be created."
}

variable "vnet_address_prefix" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The address prefix for the virtual network, e.g., '10.0.0.0/16'."
}

variable "subnet_name" {
  type        = string
  default     = "default"
  description = "The name of the subnet within the virtual network."
}

variable "subnet_address_prefix" {
  type        = string
  default     = "10.0.0.0/24"
  description = "The address prefix for the subnet, e.g., '10.0.0.0/24'."
}

variable "network_security_group_name" {
  type        = string
  default     = "defaultnsg"
  description = "The name of the network security group to be created."
}

variable "public_ip_address_name" {
  type        = string
  default     = "linuxboxpip"
  description = "The name of the public IP address resource."
}

variable "vm_name" {
  type        = string
  default     = "matebox"
  description = "The name of the virtual machine to be created."
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "The size of the virtual machine, e.g., 'Standard_B1s'."
}

variable "ssh_key_public" {
  type        = string
  default     = "~/.ssh/linuxboxsshkey.pub"
  description = "The content of the public SSH key to be used for the VM's authentication."
}

variable "ssh_key_private" {
  description = "SSH private key"
  type        = string
  default     = "~/.ssh/linuxboxsshkey"
}

variable "dns_label" {
  type        = string
  default     = "matetask"
  description = "The DNS label for the public IP address. This will form part of the DNS name for the VM."
}

variable "backend_container_name" {
  type        = string
  default     = "tfstate"
  description = "The name of the container in Azure Blob Storage where Terraform state will be stored."
}

variable "container_artifacts_name" {
  type        = string
  default     = "task-artifacts"
  description = "The name of the storage container used to store deployment artifacts."
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account to be created"
}
