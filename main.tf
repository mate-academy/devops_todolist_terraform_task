module "network" {
  source = "./modules/network"

  location                    = var.location
  resource_group_name         = var.resource_group_name
  dns_label                   = var.dns_label
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  subnet_address_prefix       = var.subnet_address_prefix
  subnet_name                 = var.subnet_name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
}

module "compute" {
  source = "./modules/compute"

  vm_name = "matebox"

  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = var.admin_username
  vm_size             = var.vm_size
  ssh_key_path        = var.ssh_key_path
  source_image_reference = {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }

  subnet_id                 = module.network.subnet_id
  public_ip_address_id      = module.network.public_ip_address_id
  network_security_group_id = module.network.network_security_group_id
}

module "storage" {
  source = "./modules/storage"

  location            = var.location
  resource_group_name = var.resource_group_name
}
