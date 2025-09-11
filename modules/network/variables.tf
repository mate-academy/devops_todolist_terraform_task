variable "location" {
  description = "The Azure region where the virtual network will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "dns_label" {
  description = "Base DNS label for the public IP (random integer will be appended)"
  type        = string
  default     = "matetask"
}

variable "public_ip_address_name" {
  description = "Public IP address name"
  type        = string
  default     = "linuxboxpip"
}

variable "network_security_group_name" {
  description = "Network Security Group name"
  type        = string
  default     = "defaultnsg"
}