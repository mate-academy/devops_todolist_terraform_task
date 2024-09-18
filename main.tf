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
  subscription_id = "d345fa5d-4fda-4d1e-abf1-c8a7e4fb0576"
  tenant_id       = "e84abfc3-c8c5-4892-8f6d-942a64e5bfc4"
}


resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  dns_label           = var.dns_label
}

module "compute" {
  source              = "./modules/compute"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  vm_name             = var.vm_name

  subnet_id         = module.network.subnet_id
  public_ip_address = module.network.public_ip_address
  ssh_key           = var.ssh_key
  blob_url             = "https://raw.githubusercontent.com/mate-academy/devops_todolist_terraform_task/main/install-app.sh"
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  storage_account_name = var.storage_account_name
}
