variable "location" {
  description = "The location where all resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain all the resources."
  type        = string
}

variable "dns_label" {
  description = "The DNS label assigned to the public IP address."
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network, in CIDR format."
  type        = list(string)
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet, in CIDR format."
  type        = list(string)
}

variable "virtual_network_name" {
  description = "The name of the virtual network to be created."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network."
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group associated with the subnet."
  type        = string
}

variable "nsg_rules" {
  description = "A list of objects defining the NSG rules. Each rule object should include a name, priority, and destination port range. The rules will be applied with Inbound direction, Allow access, and TCP protocol by default."
  type = list(object({
    name                   = string
    priority               = number
    destination_port_range = string
  }))
}


variable "public_ip_address_name" {
  description = "The name of the public IP address resource with dynamic allocation method."
  type        = string
}
