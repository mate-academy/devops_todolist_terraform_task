variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "ssh_public_key" {
  type    = string
  default = "~/.ssh/linuxboxsshkey.pub"
}
