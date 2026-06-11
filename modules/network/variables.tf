variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  description = "The name of the virtual network to create."
  type        = string

  default = "vnet"
}

variable "vnet_address_prefixes" {
  description = "The address prefixes for the virtual network."
  type        = list(string)

  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet to create."
  type        = string

  default = "subnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)

  default = ["10.0.0.0/24"]
}

variable "nsg_name" {
  description = "The name of the network security group to create."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_name" {
  description = "The name of the public IP address to create."
  type        = string
  default     = "publicip"
}

variable "dns_label" {
  description = "The DNS label for the public IP address."
  type        = string
  default     = "matetask"
}
