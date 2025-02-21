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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD5Ue9ClZamQtqa8MaU1M4cAHj4AJcAeAFAY6KIQLFCnz0y6Nwkdn6Og1BAEb0OowFyi8T+f//fmIZgW3Ylbk4jbgnkL/te8tTxfJ8hCPOPPAVxlH1dny7hCjRB4Xqwjy3MSBCdRwHWlLWtW87mgo+MIozNcahx/ub5xFDYYfK+lQwQSCdTqSWiazXJvLNvcQeinNq+Dm+u69d6+Deacrn7JziVrLDs1o9HbPUldfiOVtKRjAUadaPUuRWkSxeybwTPpQE/7fjZVUDA2UCbPh9zX8Y+W9RBwwtAdRP1VdGMiodxroA2npQsdZihPhzjZ9tRYL59BIK1qGLZTvWj60P6W6svMwZfOoREsTJuoaHVbAaF7lRHFdY4c9m0epVuOBvuxouhpf3XC/4nuKB28F7dYT+n3/Dz8gheFtsEwpFd8mLSmAdO5ZPnv0NRVlsx1+OoJho0G9LXQ2qkxr7dAKJ4WY2RN8ArBY3DyQnuh8E/KnesbUiQ4ifh32elaYsZ6b57Dyp61qnBsVrIz8FGBpHsyMZBdFxWqthWB2xyc2usxBN+FNeYWDUIT/p03cJJQtEjJw66b131uEj0aILRceO/Xwd1VUOuR1JfqP1bB7dcycrqmmmIEMPBftg+7CDmZfwgVIWSlDl4eRr605erMHNXNUSdgmC36qpsw378PoLAAw== p1tonidze422@example.com"
}

variable "dns_label" {
  default = "matetask"
}
