provider "azurerm" {
  features {}
  subscription_id = "6a8d93ad-791e-41b1-a745-b6c493b83991"
}



resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}


module "compute" {
  source = "./modules/compute"
  network_security_group_id = module.network.network_security_group_id
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  vm_name             = var.vm_name
  vm_size             = var.vm_size
  ssh_key_public      = var.ssh_key_public

  public_ip_address_name = var.public_ip_address_name
  subnet_id           = module.network.subnet_id
  public_ip_id        = module.network.public_ip_id

  storage_account_name = module.storage.storage_account_name
  storage_account_key  = module.storage.primary_access_key
  script_blob_url      = module.storage.script_blob_url

  depends_on = [module.storage]
}

module "network" {
  source = "./modules/network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  vnet_address_prefix = var.vnet_address_prefix
  virtual_network_name          = var.virtual_network_name
  subnet_name                   = var.subnet_name
  subnet_address_prefix         = var.subnet_address_prefix
  network_security_group_name   = var.network_security_group_name
  public_ip_address_name = var.public_ip_address_name
  public_ip_allocation_method   = "Dynamic"

}


module "storage" {
  source = "./modules/storage"
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_container_name = var.storage_container_name
  storage_account_key = var.storage_account_key
  storage_account_name = module.storage.storage_account_name
}
