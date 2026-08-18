resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "storage" {
  source = "./modules/storage"

  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}

module "network" {
  source = "./modules/network"

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
  source = "./modules/compute"

  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_id
  ssh_key              = var.ssh_key_public
  admin_username       = "matebox"
}