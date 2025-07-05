terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "azrg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.azrg.name
  location            = azurerm_resource_group.azrg.location

  public_ip_name          = var.public_ip_name
  net_security_group_name = var.net_security_group_name
  vnet_name               = var.vnet_name
  vnet_address_pref       = var.vnet_address_pref
  subnet_name             = var.subnet_name
  address_prefix          = var.address_prefix
  dns_label               = var.dns_label
  random_num              = var.random_num
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.azrg.name
  location            = azurerm_resource_group.azrg.location

  public_ip_id   = module.network.public_ip
  ssh_key_public = var.ssh_key_public

  vm_name           = var.vm_name
  vm_extension_name = var.vm_extension_name
  vm_size           = var.vm_size

  subnet_id = module.network.subnet_id
}

module "storage" {
  source              = "./modules/storage"
  resource_group_name = azurerm_resource_group.azrg.name
  location            = azurerm_resource_group.azrg.location

  storage_acc_name  = var.storage_acc_name
  storage_cont_name = var.storage_cont_name
}