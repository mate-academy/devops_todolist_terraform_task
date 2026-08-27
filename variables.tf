variable "resource_group_name" {
  default = "mate-azure-task-12"
}
variable "location" {
  default = "uksouth"
}

variable "vm_name" {
  default = "matebox"
}

variable "virtual_network_name" {
  default = "vnet"
}

variable "vnet_address_prefix" {
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  default = "default"
}

variable "subnet_address_prefix" {
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  default = "linuxboxpip"
}

variable "vm_size" {
  default = "Standard_D2s_v3"
}

variable "ssh_key_public" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyk9M7EY2Zq8OZjsH/XwBrdHRUNA6q5kLEdlZ34efgbkCeMf1pTcDJs/J2ap5efFA6D9v4J1eaKSyjaxEZDLz91zOgFM+4GtF2yiAT2w9UWRlqWQrs6FwpltUL+4mTkh+J1rNdOf7lC+oSeynAWB+g+utlIAcwE4Cy9iFM5FibCBez39ATpbXNzVaR658e6JrBvM95MKPWK4vPeo8soYbro8D/Y4gBZUnYLlKNi94vYmvJoQFIpm9bS3MsYXKpNZ9jtnE0un7AUHp6y0eWUcJLb4f6G1a2wflk4QtDJuRLnLsrN/bD84QpOeRp4pYE63597bwBQdcJEoLpsZgrzFGl"
}

variable "dns_label" {
  default = "matetask"
}