resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.pip_id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = var.vm_size

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    name                 = "${var.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  computer_name  = "matebox"
  admin_username = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_key_public
  }
}

resource "azurerm_virtual_machine_extension" "api_install" {
  name                 = "install-api"
  virtual_machine_id   = azurerm_linux_virtual_machine.main.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
  {
    "fileUris": ["https://raw.githubusercontent.com/dimak20/azure_task_12_deploy_app_with_vm_extention/main/install-app.sh"],
    "commandToExecute": "bash install-app.sh"
  }
  SETTINGS
}
