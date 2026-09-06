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

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

module "network" {
  source = "./modules/network"

  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  vm_name        = var.vm_name
  vm_size        = var.vm_size
  ssh_key_public = var.ssh_key_public

  subnet_id    = module.network.subnet_id
  public_ip_id = module.network.public_ip_id

  install_app_url = module.storage.install_app_url
}