terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.this.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.linuxboxsshkey
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server"
    sku       = "22_04-lts"
    version   = "latest"
  }

}

resource "azurerm_virtual_machine_extension" "this" {
  name                 = "CustomScript"
  virtual_machine_id   = azurerm_linux_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    script = filebase64("${path.root}/install-app.sh")
  })

}
