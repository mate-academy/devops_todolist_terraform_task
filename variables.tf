variable "subscription_id" {
  description = "Azure Subscription ID to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "uksouth"
}

variable "environment" {
  description = "Deployment environment label (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of the main resource group"
  type        = string
  default     = "mate-azure-task-12"
}

variable "tags" {
  description = "Additional tags to merge onto all resources"
  type        = map(string)
  default     = {}
}

# ── Network ──────────────────────────────────────────────────────────────────

variable "virtual_network_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "vnet"
}

variable "vnet_address_prefix" {
  description = "Address prefix(es) for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "default"
}

variable "subnet_address_prefix" {
  description = "Address prefix(es) for the Subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "defaultnsg"
}

variable "public_ip_address_name" {
  description = "Name of the Public IP Address resource"
  type        = string
  default     = "linuxboxpip"
}

variable "dns_label" {
  description = "Base DNS label for the Public IP (a random 4-digit suffix is appended automatically to ensure global uniqueness)"
  type        = string
  default     = "matetask"
}

# ── Compute ───────────────────────────────────────────────────────────────────

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "matebox"
}

variable "vm_size" {
  description = "SKU size of the Virtual Machine"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_key_public" {
  description = "Public SSH key content for VM access"
  type        = string
  sensitive   = true
}

# ── Storage ───────────────────────────────────────────────────────────────────

variable "storage_account_name" {
  description = "Name of the storage account for application artifacts (globally unique, 3–24 chars, lowercase alphanumeric only)"
  type        = string
  default     = "matetaskappstorage"
}

variable "storage_container_name" {
  description = "Name of the blob container for application artifacts"
  type        = string
  default     = "task-artifacts"
}