variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for Azure resources"
  type        = string
}

variable "vm_name" {
  default = "matebox"
}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "ssh_pub_key_file" {
  description = "Path to SSH public key file"
  type        = string
}
variable "ssh_private_key_file" {
  description = "Path to SSH private key file"
  type        = string
}
variable "dns_label" {
  default = "matetask"
}
variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "Address prefix for the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
}

variable "public_ip_address_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}
