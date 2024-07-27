variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
  default     = "uksouth"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "The address prefix for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "The name of the public IP address"
  type        = string
  default     = "linuxboxpip"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "The public SSH key for the virtual machine"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC509AfhZY/nzPlu1YhNA7qW3S+VQDbS++SozRNurmlL8PElqcjzBz25ukfabxW90EddIgVu698XOLCplH11Z3JkqxxVpjAvzfewI7kIpAzqHbs9I/P8aV1L2NgRqJpjDIkqIrp62N/CjJLE/iO0zTG6pJ1ugpFcV6ghChVHk+NY63NXWbIVpYsuX/04eOIE6UmevubYo8ArX092Z4NJUjtQrgbPugQv04vwehapqG0YT0dExhiYhjtyeWLl7v9/aybUH0gtk/Tqf6sKkBPiZ1+YoWWU7Otd8wIrZ90NMD6xvePfFhX3YTZUQXfAd5+BeMiejQt587v2R4/mwNOPo3F4b1q0S/rtF2RqgXOGltRbf9zWH7SknHuzuWI8nIyohpGkn7SpGUQa6QbCR8DQ7V21nph+3jvX56PnWe/FIV9Iogdj7MoWsd0NDr2kiDOujwa8ScoZK4aW3ycHi5GayXH1mL2Qr1kh99abB39o4RzGQl2tII4H3H+h2PYEhumc78= alexh@alexh-work-laptop"
}

variable "dns_label" {
  description = "The DNS label for the public IP address"
  type        = string
  default     = "matetask"
}

variable "extension_name" {
  description = "The name of the VM extension"
  type        = string
  default     = "install_script"
}

variable "ssh_private_key" {
  description = "The private SSH key for the virtual machine"
  type        = string
  sensitive   = true
}