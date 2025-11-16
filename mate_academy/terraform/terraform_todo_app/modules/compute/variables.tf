variable "resource_group_name" { type = string }
variable "location" { type = string }

variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "admin_username" { type = string }
variable "ssh_key_public" { type = string }

variable "subnet_id" { type = string }
variable "nsg_id" { type = string }
variable "public_ip_id" { type = string }

variable "install_script_url" { type = string }

variable "tags" {
  type    = map(string)
  default = {}
}
