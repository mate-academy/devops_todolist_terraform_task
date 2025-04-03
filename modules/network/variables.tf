variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address space of the virtual network"
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
}

variable "public_ip_address_name" {
  description = "The name of the public IP"
  type        = string
}

variable "network_security_rules" {
  description = "A list of network security rules, each containing a name, priority, and destination port range."
  type = list(object({
    name                   = string
    priority               = number
    source_port_range      = string
    destination_port_range = string
  }))
  default = [{
    name                   = "ssh",
    priority               = 1001,
    source_port_range      = "22",
    destination_port_range = "22"
    }, {
    name                   = "HTTP",
    priority               = 1002,
    source_port_range      = "80",
    destination_port_range = "80"
  }]
}

variable "dns_label" {
  description = "DNS label for the public IP"
  type        = string
}
