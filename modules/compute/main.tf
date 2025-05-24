resource "azurerm_network_interface" "main" {
  name                = "${var.azurerm_virtual_machine}-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_ssh_public_key" "linuxboxsshkey" {
  name                = var.ssh_name
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = var.ssh_key_public
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = var.azurerm_virtual_machine
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.main.id]
  size                  = var.azurerm_virtual_machine_size
  admin_username        = var.username

  admin_ssh_key {
    username   = var.username
    public_key = azurerm_ssh_public_key.linuxboxsshkey.public_key
  }

  os_disk {
    name                 = var.storage_os_disk_name
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  disable_password_authentication = true

}

resource "azurerm_virtual_machine_extension" "main" {
  name                 = var.azurerm_virtual_machine_extension
  virtual_machine_id   = azurerm_linux_virtual_machine.main.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  protected_settings = jsonencode({
    "fileUris" = [
      "https://raw.githubusercontent.com/konstantinou77/devops_todolist_terraform_task/main/install-app.sh"
    ],
    "commandToExecute" : "bash install-app.sh"
  })
}

