resource "azurerm_network_interface" "nic" {
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

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size

  admin_username = "azureuser"
  custom_data    = filebase64("${path.root}/install-app.sh")

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_key_public
  }

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "18.04.202401161"
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_extension" "custom_script" {
  name                 = var.extension_name
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
    {
        "fileUris": ["https://raw.githubusercontent.com/ILyakhova/devops_todolist_terraform_task/main/install-app.sh"],
        "commandToExecute": "bash install-app.sh"
    }
SETTINGS
}
