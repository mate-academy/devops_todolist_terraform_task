variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type    = string
  default = "matebox"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type = string
}

variable "ssh_key_public" {
  type = string
}

variable "script_url" {
  type    = string
  default = "https://raw.githubusercontent.com/baga090/devops_todolist_terraform_task/main/install-app.sh"
}