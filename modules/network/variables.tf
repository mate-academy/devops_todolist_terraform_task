variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "vnet_name" { type = string }
variable "vnet_address_space" { type = list(string) }

variable "subnet_name" { type = string }
variable "subnet_address_prefix" { type = string }

variable "nsg_name" { type = string }

variable "public_ip_name" { type = string }
variable "dns_label_prefix" { type = string }
