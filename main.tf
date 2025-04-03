terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "45bb3ad1-07fa-405a-9924-4d73f427fe82"
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_container" "backend" {
  name                  = var.backend_container_name
  storage_account_id    = module.storage.storage_account_id
  container_access_type = "private"
  depends_on            = [module.storage]
}

module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

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
  location             = var.location
  resource_group_name  = azurerm_resource_group.main.name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  ssh_key_public       = var.ssh_key_public
  ssh_key_private      = var.ssh_key_private
  subnet_id            = module.network.subnet_id
  admin_username       = var.admin_username
  public_ip_address_id = module.network.public_ip_address_id
  public_ip_dns        = module.network.public_ip_dns
  depends_on           = [azurerm_resource_group.main, module.network, module.storage]
}

module "storage" {
  source                   = "./modules/storage"
  depends_on               = [azurerm_resource_group.main]
  storage_location         = var.location
  resource_group_name      = azurerm_resource_group.main.name
  container_artifacts_name = var.container_artifacts_name
}
