variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "virtual_network_name" { type = string }
variable "vnet_address_prefix" { type = string }
variable "subnet_name" { type = string }
variable "subnet_address_prefix" { type = string }
variable "network_security_group" { type = string }
variable "public_ip_name" { type = string }
variable "dns_label" { type = string } # базова частина, наприклад "matetask"

variable "vm_name" { type = string }
variable "vm_size" { type = string }
variable "ssh_key_public" { type = string }

# Для CustomScript extension: звідки тягнути install-app.sh
variable "install_script_url" {
  type        = string
  description = "HTTP(S) URL до install-app.sh (наприклад, raw.githubusercontent.com/.../devops_todolist_terraform_task/install-app.sh)"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID (AAD directory ID)"
}
