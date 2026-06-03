variable "resource_group_name" {
  type        = string
  description = "Resource resource group"
}

variable "location" {
  type        = string
  description = "Resource location"
}

variable "vnet_name" {
  type        = string
  default     = "vnet"
  description = "Virtual Network name"
}

variable "vnet_address_space" {
  type = list(string)
  default = [
    "10.0.0.0/16"
  ]
  description = "Address space from virtual network"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type        = string
  default     = "10.0.0.0/24"
  description = "Address Prefixes for subnet"
}

variable "nsg_name" {
  type        = string
  default     = "defaultnsg"
  description = "Network Security Group Name"
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
  default = [
    {
      "name" : "SSH"
      "priority" : 100
      "direction" : "Inbound"
      "access" : "Allow"
      "protocol" : "Tcp"
      "source_port_range" : "*"
      "destination_port_range" : "22"
      "source_address_prefix" : "*"
      "destination_address_prefix" : "*"
    },
    {
      "name" : "HTTP"
      "priority" : 101
      "direction" : "Inbound"
      "access" : "Allow"
      "protocol" : "Tcp"
      "source_port_range" : "*"
      "destination_port_range" : "80"
      "source_address_prefix" : "*"
      "destination_address_prefix" : "*"
    },
    {
      "name" : "HTTPS"
      "priority" : 102
      "direction" : "Inbound"
      "access" : "Allow"
      "protocol" : "Tcp"
      "source_port_range" : "*"
      "destination_port_range" : "443"
      "source_address_prefix" : "*"
      "destination_address_prefix" : "*"
    },
    {
      "name" : "TODOAPP"
      "priority" : 103
      "direction" : "Inbound"
      "access" : "Allow"
      "protocol" : "Tcp"
      "source_port_range" : "*"
      "destination_port_range" : "8080"
      "source_address_prefix" : "*"
      "destination_address_prefix" : "*"
    },
  ]
  description = "Map of security rules for network security group"
}

variable "pip_name" {
  type        = string
  default     = "linuxboxpip"
  description = "name of public ip adress"
}

variable "pip_allocation_method" {
  type        = string
  default     = "Static"
  description = "Defines Allocation Method for public IP Could be Static or Dynamic"
}

variable "dns_label_prefix" {
  type        = string
  default     = "matetask"
  description = "Default DNS label prefix that will be concatenated with random number"
}

variable "dns_custom_label" {
  type    = string
  default = null
}