terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "network" {
  source = "./modules/network"

  resource_group_name         = var.resource_group_name
  location                    = var.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label_prefix            = var.dns_label
  vm_name                     = var.vm_name
}

module "storage" {
  source = "./modules/storage"

  resource_group_name     = var.resource_group_name
  location                = var.location
  storage_account_name    = var.storage_account_name
  install_app_script_path = var.install_app_script_path
}

module "compute" {
  source = "./modules/compute"

  resource_group_name  = var.resource_group_name
  subnet_id            = module.network.subnet_id
  public_ip_id         = module.network.public_ip_id
  location             = var.location
  vm_name              = var.vm_name
  admin_username       = var.admin_username
  admin_ssh_key        = var.ssh_key_public
  vm_size              = var.vm_size
  storage_account_name = var.storage_account_name
  storage_account_key  = module.storage.storage_account_primary_key
  container_name       = var.container_name
}
