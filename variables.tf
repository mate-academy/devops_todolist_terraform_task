variable "location" {
  type        = string
  description = "The location of the resource group"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string

  }))
  description = "List of security rules for the network security group"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "vnet_address_prefix" {
  type        = string
  description = "The address prefix of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "subnet_address_prefix" {
  type        = string
  description = "The address prefix of the subnet"
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the network security group"
}

variable "public_ip_address_name" {
  type        = string
  description = "The name of the public IP"
}

variable "dns_label" {
  type        = string
  description = "The lable of the dns"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "The size of the VM"
}

variable "ssh_key_public" {
  type        = string
  description = "The SSH public key for the virtual machine"
}

variable "sc_name" {
  type        = string
  description = "The name of the storage container"
}

variable "sa_name" {
  type        = string
  description = "The name of the storage account"
}
