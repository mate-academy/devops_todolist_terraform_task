terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "storage_module" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.main.name
  storage_account_name = var.storage_account_name
  location             = var.location
}

module "network_module" {
  source                      = "./modules/network"
  resource_group_name         = azurerm_resource_group.main.name
  location                    = var.location
  virtual_network_name        = var.virtual_network_name
  subnet_name                 = var.subnet_name
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_address_prefix       = var.subnet_address_prefix
  dns_label                   = var.dns_label
}

module "compute_module" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key_public      = var.ssh_key_public
  subnet_id           = module.network_module.subnet_id
  public_ip_id        = module.network_module.public_ip_id
}
