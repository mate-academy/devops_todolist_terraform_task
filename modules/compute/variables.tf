variable "location" {
  default = "West Us"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "example-resources"
}

variable "subnet_id" {

}

variable "public_ip_id" {

}

variable "vm_name" {
  default = "matebox"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "ssh_key_public" {

}