provider "azurerm" {
  features {}

}

resource "azurerm_resource_group" "example" {
  name     = "mate-azure-task-12"
  location = "West Europe"
}

# resource "azurerm_storage_account" "example" {
#   name                     = "yourstorageaccount22123"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "example" {
#   name                  = "tfstate22"
#   storage_account_id    = azurerm_storage_account.example.id
#   container_access_type = "private"
# }

module "network" {
  source = "./modules/network"

  location                    = var.location
  resource_group_name         = var.resource_group_name
  vnet_name                   = var.virtual_network_name
  vnet_address_space          = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_name              = var.public_ip_address_name
  dns_label                   = var.dns_label
}

module "compute" {
  source = "./modules/compute"

  location            = var.location
  resource_group_name = var.resource_group_name
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key             = var.ssh_key_public
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id
}

module "storage" {
  source = "./modules/storage"

  location               = var.location
  resource_group_name    = var.resource_group_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}
