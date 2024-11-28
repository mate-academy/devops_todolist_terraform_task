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

resource "azurerm_resource_group" "main" {
  name     = "todolist-terraform-task"
  location = "West Europe"
}

module "network" {
  source               = "./modules/network"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  dns_label_prefix     = var.dns_label
  virtual_network_name = var.virtual_network_name
  vnet_address_prefix  = var.vnet_address_prefix
}

module "compute" {
  source               = "./modules/compute"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  vm_name              = var.vm_name
  subnet_id            = module.network.subnet_id
  public_ip_id         = module.network.public_ip_address
  ssh_key              = var.ssh_key
  virtual_network_name = var.virtual_network_name
  vnet_address_prefix  = var.vnet_address_prefix
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  storage_account_name = var.storage_account_name
}
