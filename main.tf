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
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_container" "backend" {
  name                  = var.backend_container_name
  storage_account_name  = module.storage.storage_account.name
  container_access_type = "private"
  depends_on            = [module.storage]
}

module "network" {
  source                      = "./modules/network"
  depends_on                  = [azurerm_resource_group.main]
  resource_group_name         = azurerm_resource_group.main.name
  location                    = azurerm_resource_group.main.location
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "compute" {
  source               = "./modules/compute"
  depends_on           = [azurerm_resource_group.main, module.network, module.storage]
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  subnet_id            = module.network.subnet.id
  public_ip_address_id = module.network.public_ip.id
  admin_username       = var.admin_username
  linuxboxsshkey       = var.ssh_key_public
  blob_url             = module.storage.storage_blob.url
  blob_name            = module.storage.storage_blob.name
}

module "storage" {
  source                        = "./modules/storage"
  depends_on                    = [azurerm_resource_group.main]
  resource_group_name           = azurerm_resource_group.main.name
  location                      = azurerm_resource_group.main.location
  storage_account_name          = var.storage_account_name
  task_artifacts_container_name = var.task_artifacts_container_name
}
