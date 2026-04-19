variable "vm_name" {
  type = string
}
variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}
variable "subnet_id" {
  type = string
}
variable "public_ip_id" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "ssh_key_public" {
  type      = string
  sensitive = true
}

variable "github_repo" {
  type = string
}