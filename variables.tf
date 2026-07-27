variable "location" {
  type    = string
  default = "polandcentral"
}

variable "resource_group_name" {
  type    = string
  default = "mate-azure-task-12"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet"
}

variable "vnet_address_prefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_name" {
  type    = string
  default = "default"
}

variable "subnet_address_prefix" {
  type    = string
  default = "10.0.0.0/24"
}

variable "network_security_group_name" {
  type    = string
  default = "defaultnsg"
}

variable "public_ip_address_name" {
  type    = string
  default = "linuxboxpip"
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "ssh_key_public" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9Te0YRyqh+3yqF7OWjhvbgIo7py+rpR2RihheSwyT67j2VqrrFA2DRDhRexezIMqyhd80F/IX8UyP5dztaocqJrrBZKTisNMDj58LTUu3Ycxx/HVbu0tS14VIP2r6jM+gL9MQze4U3yKv7p1whtP7TOBdg18rKjK2e4H4xihifrbcfT0HnmxvsHm5+rnvvbBQiZ3wtZB+idHzn0vTHD04Q/M+IojXvz6Dyab0+KmAhoZsdVrpsRCJEjRR4yJFpS4pkFgYy/LI2GtE2CZONN58OPpXEzo6cwtZ9HIDNec1OyCTT/xrq+7GVe5n9WYeOLmsG4OAkC9hBEHYYi5JuMzYSWw5ipaupQ2/1f3P0hREdpBRI2VSHBh8Q/eULhnYmcufGVlVIAk2NAYipea75y6f2FYJvgkn+VEsXvx6w2tXTi0Quxvt4vP5SzScrr0V6HXBR2yO7GAJHg5U47O0i0NxnoeVu47TaAV2xYS/DK2rYq9Pq4oLYZK9IOQiPRJqt1w2kB5dFKIOKA3cxIeVdvN4kkXehLJQn1QFAWv466C+yWFel1Zc5qnwUiZH+zGfY+iwG7yCuPqGuNU5kR031UdgRv5BWj4AFzQvqpzlc6BZcRlnrHJL97/vc5PrKKm9FtT+iwuI9sDPu3S20euuIrVB0fx7gZCzro8heXVjuPXFbQ== dianahorban477@gmail.com"
}

variable "dns_label" {
  type    = string
  default = "matetask"
}