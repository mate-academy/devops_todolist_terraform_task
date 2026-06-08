terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.110.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
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

module "network" {
  source = "./modules/network"

  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  dns_label_prefix            = var.dns_label
}

module "storage" {
  source = "./modules/storage"

  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  storage_account_name_prefix = var.storage_account_name_prefix
  storage_container_name      = var.storage_container_name
}

module "compute" {
  source = "./modules/compute"

  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
  ssh_key_public      = var.ssh_key_public
  custom_script_content = templatefile("${path.root}/install-app.sh", {
    repository_url = var.repository_url
  })
}
