variable "location" {
  default = "uksouth"
}

variable "resource_group_name" {
  default = "mate-azure-task-12"
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

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "ssh_key_public" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDb4Yoa3tEpy92WT0u963xnKfE5j1gbBwmFnNWAGIwIQacyXCnBIhUOM+IWO2NnF7Qf9c0uby6+ymgXms7G/sQRMNBFPP10+qZ6ZFXpjT/JPnfxalMeRahhCQXWGXj1jiyZWcF4LE5As1burd5korO8CmprbkhjYqJhmj5ONpk7ldZeKDS3Q8gYZ6+M1tqcY1rVQ3fKuvDXs8JMCLWeHSm+xi8qsqt5kjs18y5lpZPDDwbcjbMKUgsJHqasz5bgnnT9YBc+HzcI/B6DjbX2LgMHDPIVG5UyxdWFjRsVdtkRjfYMNBI2efJWUDCWhdMQ7/mUdfF+QKprD3ssBASVWd9/ ipppk@LAPTOP"
}

variable "dns_label" {
  default = "matetask"
}

variable "extension_name" {
  default = "install_script"
}
