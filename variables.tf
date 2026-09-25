variable "location" {
  description = "The location where the resources will be created."
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}
variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "The name of the network security group."
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address."
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "The public SSH key for the virtual machine."
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVbMi7hYL6D49F6xe+YLMfEhsK+gvC3+4uDU0OY40gHL5lUdNYZBEdg96jAYGY2MnNgWejLPGbwAnl/kkjFipxwvrSsMfKtlEUqdG8FPrWvphmUOMfql1tmLkDkwZhud5HCbkU66/aUzkA7ZaNBNAil07XuSvBY3S5fTRcCDIPA5H6gph0cdujdOOB8QlLc2jItS+Vk1BaKplquas8CyqQNcIVvCitoAFaiNUA45JLBUAUV7yhls2w/fObmRtdXwT+NhUWjPXnFN/7eGW0H16isMf1NR3u5s2zPN8ta6cwRcIfxp/qmDeBZ4ikXtQB6kmMEJTh6DADoOZM+LOWo/z4GuA/zF1tY+yAeJHUWgw9d9yoir3kZxI2AFkSioiqZYBpZNbeuDYyXRNUpJh46zMNraIK84C1YWzPdj7JnW6GRAhMC0W/Tq0lBvh2HpcWZpLY3R4fvwygw5soTZ32/pyatqwuEyNlNmG0IQcjpGaLJ3BZxhqOAzWNjp0ltgecNx0= kaaaydi"
}

variable "dns_label" {
  description = "The DNS label for the public IP address."
  type        = string
  default     = "matetask"
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "mateazuretask12storage"
}