variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The Azure region to deploy resources into"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network"
}

variable "subnet_name" {
  description = "The name of the subnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
}

variable "network_security_group_name" {
  description = "The name of the network security group"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address"
}

variable "dns_label" {
  description = "The DNS label for the public IP address"
}

variable "vm_name" {
  description = "The name of the virtual machine"
}

variable "vm_size" {
  description = "The size of the virtual machine"
}

variable "ssh_key_public" {
  description = "The public SSH key"
}

variable "extension_name" {
  description = "The name of the VM extension"
}

variable "git_repo_url" {
  description = "The URL of the Git repository"
  default     = "https://github.com/ILyakhova/devops_todolist_terraform_task.git"
}
