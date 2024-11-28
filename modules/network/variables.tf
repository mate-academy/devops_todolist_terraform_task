variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "default"
}

variable "network_security_group_name" {
  description = "The name of the Network Security Group."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address."
  type        = string
  default     = "linuxboxpip"
}

variable "vnet_address_prefix" {
  description = "Virtual Network address prefix"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix"
  type        = string
  default     = "10.0.0.0/24"
}

variable "dns_label" {
  default = "matetask"
}

variable "security_rules" {
  description = "A list of security rules for the Network Security Group."
  type = list(object({
    name                   = string
    priority               = number
    direction              = string
    access                 = string
    protocol               = string
    source_port_range      = string
    destination_port_range = string
  }))
  default = [
    {
      name                   = "allow-ssh"
      priority               = 100
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "22"
    },
    {
      name                   = "allow-http"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "80"
    },
    {
      name                   = "allow-https"
      priority               = 300
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "443"
    }
  ]
}

