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
  source                      = "./modules/network"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  dns_label                   = var.dns_label
}

module "compute" {
  source               = "./modules/compute"
  location             = azurerm_resource_group.main.location
  resource_group_name  = azurerm_resource_group.main.name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_address_id
  ssh_key              = var.ssh_key
  blob_url             = var.blob_url
}

module "storage" {
  source                 = "./modules/storage"
  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  source_file_path       = var.source_file_path

}

resource "null_resource" "clone_git_repo" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y git",
      "git clone https://github.com/Serveladik/devops_todolist_terraform_task /home/azureuser/devops_todolist_terraform_task"
    ]

    connection {
      type        = "ssh"
      user        = "azureuser"
      private_key = var.ssh_key
      host        = module.network.public_ip_address
    }
  }

  depends_on = [module.compute]
}
