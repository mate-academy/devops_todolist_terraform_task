provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "storageippk"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

module "network" {
  source                      = "./modules/network"
  location                    = var.location
  resource_group_name         = var.resource_group_name
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
  resource_group_name  = var.resource_group_name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  ssh_key_public       = var.ssh_key_public
  ssh_key_private      = var.ssh_key_private
  admin_username       = var.admin_username
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_address_id
  public_ip_address    = module.network.public_ip_address
  tags                 = var.tags
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = var.resource_group_name
}
