variable "resource_group_name" {
  description = "Назва групи ресурсів, до якої належить віртуальна машина."
  type        = string
}

variable "location" {
  description = "Регіон Azure для віртуальної машини."
  type        = string
}

variable "virtual_network_name" {
  description = "Назва віртуальної мережі."
  type        = string
}

variable "vnet_address_prefix" {
  description = "Префікс адреси для віртуальної мережі."
  type        = list(string)
}

variable "subnet_name" {
  description = "Назва підмережі."
  type        = string
}

variable "subnet_address_prefix" {
  description = "Префікс адреси для підмережі."
  type        = list(string)
}

variable "network_security_group_name" {
  description = "Назва групи безпеки мережі."
  type        = string
}

variable "public_ip_address_name" {
  description = "Назва публічної IP-адреси."
  type        = string
}

variable "dns_label" {
  description = "Мітка DNS для публічної IP-адреси."
  type        = string
}
