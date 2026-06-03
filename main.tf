terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.75.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  source                = "./modules/network"
  resource_group_name   = azurerm_resource_group.default.name
  location              = azurerm_resource_group.default.location
  subnet_name           = var.subnet_name
  dns_label_prefix      = var.dns_label
  dns_custom_label      = var.dns_custom_label
  subnet_address_prefix = var.subnet_address_prefix
  nsg_name              = var.network_security_group_name
  pip_name              = var.public_ip_address_name
}


module "computing" {
  source                    = "./modules/compute"
  resource_group_name       = azurerm_resource_group.default.name
  location                  = azurerm_resource_group.default.location
  vm_name                   = var.vm_name
  subnet_id                 = module.network.subnet_id
  public_ip_address_id      = module.network.pip_id
  admin_username            = var.admin_username
  path_to_ssh_key           = var.ssh_key_public
  vm_size                   = var.vm_size
  network_security_group_id = module.network.network_security_group_id
}

module "storage_account" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.default.name
  location             = azurerm_resource_group.default.location
  storage_account_name = var.storage_account_name
}