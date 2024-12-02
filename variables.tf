variable "location" {
  description = "The location where all resources will be deployed."
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain all the resources."
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "The name of the virtual network to be created."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network, in CIDR format."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet, in CIDR format."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "network_security_group_name" {
  description = "The name of the network security group associated with the subnet."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address resource with dynamic allocation method."
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "The name of the virtual machine to be created."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine, specifying its resources."
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "The path to the public SSH key used for authentication."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "dns_label" {
  description = "The DNS label assigned to the public IP address."
  type        = string
  default     = "matetask"
}

variable "task_artifacts_container_name" {
  description = "The name of the storage container for task artifacts."
  type        = string
  default     = "task-artifacts"
}

variable "backend_container_name" {
  description = "The name of the backend container for storing the Terraform state."
  type        = string
  default     = "tfstate"
}

variable "storage_account_name" {
  description = "The name of the storage account to be created."
  type        = string
  default     = "shutftask12sa"
}

variable "admin_username" {
  description = "The username for the administrator account on the virtual machine."
  type        = string
  sensitive   = true
}
