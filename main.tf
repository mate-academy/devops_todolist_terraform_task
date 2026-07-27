# MAIN INFRASTRUCTURE CONFIGURATION
# This configuration provisions a complete Azure environment split into 3 core 
# modular layers: Network, Compute, and Storage.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source                = "./modules/network"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  vnet_name             = var.virtual_network_name
  vnet_address_prefix   = var.vnet_address_prefix
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  nsg_name              = var.network_security_group_name
  public_ip_name        = var.public_ip_address_name
  dns_label_prefix      = var.dns_label
}

module "compute" {
  source                 = "./modules/compute"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.location
  vm_name                = var.vm_name
  vm_size                = var.vm_size
  subnet_id              = module.network.subnet_id
  public_ip_id           = module.network.public_ip_id
  ssh_key_public         = var.ssh_key_public
  storage_account_name   = module.storage.storage_account_name
  storage_container_name = module.storage.storage_container_name
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}