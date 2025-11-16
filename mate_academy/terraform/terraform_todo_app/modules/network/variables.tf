variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "virtual_network_name" { type = string }
variable "vnet_address_prefix" { type = string }
variable "subnet_name" { type = string }
variable "subnet_address_prefix" { type = string }
variable "nsg_name" { type = string }
variable "public_ip_name" { type = string }
variable "dns_label_base" { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}
