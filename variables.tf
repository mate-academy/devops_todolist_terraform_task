variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "The public SSH key for the virtual machine"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7u7oBzYq34tCMB7c+J8kjKgHJH7t+EkrgFYOg5kXYR2BvZJm9e9nItuKHpW2YntY2fSz3LqdlQO4FkrC1VVQXcHjQm2b2lZ1YvXbkfT+fjMnY2bYZ5x1vK7g0a7iChZ5eA5ONXZVKY+weM5RLmFPlKn3eYmtDhk9I7dyUTP8YldLWRG9oeOr2vZyqUViknYfHsAlkg4h6pG2vWz6D2rO6jlY2vXKTRMxXP9YSOLvWjKrNdP6eCvxVUtZN+Pwo8FNOXz8LDfYTxd7gSlBskcM2lNxgKHVnT3AzUGvKZzjYUbZ5qAkpq1Z5cVuH5B5MYGQVkYO+Ic9Y7yMTKnwE8tGRB0T ivan@ivan-Aspire"
}

variable "dns_label" {
  description = "The DNS label for the public IP address"
  type        = string
  default     = "matetask"
}

variable "extension_name" {
  description = "The name of the VM extension"
  type        = string
  default     = "install_script"
}

variable "ssh_private_key" {
  description = "The private SSH key for the virtual machine"
  type        = string
  sensitive   = true
}
