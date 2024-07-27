provider "azurerm" {
  features {}
}

provider "null" {}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "storagegaupt"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
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
  resource_group_name         = azurerm_resource_group.rg.name
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
  subnet_id            = module.network.subnet_id
  public_ip_address_id = module.network.public_ip_id
  extension_name       = var.extension_name
  blob_url             = "https://raw.githubusercontent.com/gaupt/devops_todolist_terraform_task/main/install-app.sh"
}

module "storage" {
  source              = "./modules/storage"
  location            = var.location
  resource_group_name = var.resource_group_name
  container_name      = "task-artifacts"
  source_file_path    = "home/alexh/MATE/Terraform/devops_todolist_terraform_task/install-app.sh"
}


resource "null_resource" "clone_git_repo" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y git",
      "git clone https://github.com/gaupt/devops_todolist_terraform_task /home/azureuser/devops_todolist_terraform_task"
    ]

    connection {
      type        = "ssh"
      user        = "azureuser"
      private_key = var.ssh_private_key
      host        = module.network.public_ip_address
    }
  }

  depends_on = [module.compute]
}
