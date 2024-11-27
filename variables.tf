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

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC0lwOYOKddusMlxI/CudcsbDv1oCuXnwgZ3HoxJj+FqpKqBePyF8wQ2azh16p9IPrA2UDv7VylsyDus//Nh3/KkPi4q9G7Utiq0+M3JWEmFt3+eGUquokFnVcenCn7x5StkWNjH/QGABBfjagZBBZ03ap+LS7I1g8HxZQKr2E9uK6GN0GGrtHPiFz7Ca4y3bV9qU1pLeamaPbL9T4OE9pIFzzEXf2NULpfMkMWi9h3JKYvSIOLBr+/1MlcUE0JL3GRY6islE79GwJCrvQhHOo+LGR11QUMYzcyzrKd2x0iKmkDOSyL4cs6rHm2zwuu9RdPJ3vesHy0QBl8Fa++f8ll7vGnpaGstPJ4wRuGrEs5ue2SUrDEk/C7P7elsHxIc+uTOW916UgoDX59rywgmxzuWx/KFJ87HekTw9nFP8i4Zf895cOqDj338br3uSB2K9RIeHEch/zfW859/Zv40uFzW0bXymVF27GOkC6vuDxikSUFF9APlveAe2IhqvXQlVl9HK485WS4BvS1j/bADf6E+BuQe3jsFXvIYhGcsJ51KgFxUSNHsuLuuKRZ7SFLTvp1CVAAqQL/unOCA1RTYGUtbmCgMFEU0Fv1yCr1lGBbT4Wdfe18MTuxHAVuydtgekwhQeBoFuNmpkTBeCaqbpHA/RgPvkxe/e9Q8xMYSpM39Q== savchenkodarya277@gmail.com"
}

variable "dns_label" {
  default = "matetask"
}

