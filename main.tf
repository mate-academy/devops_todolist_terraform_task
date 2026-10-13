terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_integer" "dns_suffix" {
  min = 10000
  max = 99999
}

resource "random_string" "storage_suffix" {
  length  = 8
  lower   = true
  upper   = false
  numeric = true
  special = false
}

module "network" {
  source = "./modules/network"

  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = "${var.dns_label}${random_integer.dns_suffix.result}"
}

module "storage" {
  source = "./modules/storage"

  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  storage_account_name        = "task${random_string.storage_suffix.result}"
  storage_container_name      = var.storage_container_name
  storage_account_tier        = "Standard"
  storage_account_replication = "LRS"
}

module "compute" {
  source = "./modules/compute"

  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  ssh_key_public       = var.ssh_key_public
  subnet_id            = module.network.subnet_id
  public_ip_id         = module.network.public_ip_id
  network_security_gid = module.network.network_security_group_id
  script_url           = var.script_url
  repository_url       = var.repository_url
}
