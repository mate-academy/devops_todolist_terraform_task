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

resource "random_integer" "random" {
  min = 1000
  max = 9999
}

# Create resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name            = azurerm_resource_group.main.name
  location                       = var.location
  virtual_network_name           = var.virtual_network_name
  virtual_network_address_prefix = var.virtual_network_address_prefix
  subnet_name                    = var.subnet_name
  subnet_address_prefix          = var.subnet_address_prefix
  network_security_group_name    = var.network_security_group_name
  public_ip_address_name         = var.public_ip_address_name
  dns_label                      = "${var.dns_label}${random_integer.random.result}"
}

module "compute" {
  source = "./modules/compute"

  resource_group_name       = azurerm_resource_group.main.name
  location                  = var.location
  vm_name                   = var.vm_name
  vm_size                   = var.vm_size
  subnet_id                 = module.network.subnet_id
  public_ip_address_id      = module.network.public_ip_address_id
  ssh_key_public            = var.ssh_key_public
  network_security_group_id = module.network.network_security_group_id
}

module "storage" {
  source = "./modules/storage"

  resource_group_name  = azurerm_resource_group.main.name
  location             = var.location
  storage_account_name = "storagetask${random_integer.random.result}"
  container_name       = var.container_name
}
