terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }
  }
}

resource "azurerm_network_interface" "nic" {

  name                = "${var.vm_name}-nic"
  location            = var.resource_group_data.location
  resource_group_name = var.resource_group_data.name

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_data.name
  location            = var.resource_group_data.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_key_public
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}


resource "azurerm_virtual_machine_extension" "CustomScript" {
  name                 = "hostname"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
 {
  "fileUris": [
    "https://raw.githubusercontent.com/Alexey211220/devops_todolist_terraform_task/refs/heads/main/install-app.sh"
  ],
  "commandToExecute": "bash install-app.sh"
}
SETTINGS
}
