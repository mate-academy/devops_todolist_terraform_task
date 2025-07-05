variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

# network module vars

variable "random_num" {
  type = number
}

variable "public_ip_name" {
  type = string
}

variable "net_security_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_pref" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "address_prefix" {
  type = list(string)
}

variable "dns_label" {
  type = string
}

# compute module vars

variable "vm_name" {
  type = string
}

variable "vm_extension_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "ssh_key_public" {
  type = string
}

# storage module vars

variable "storage_acc_name" {
  type = string
}

variable "storage_cont_name" {
  type = string
}