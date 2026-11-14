resource "azurerm_network_interface" "portfolio" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "todoapp-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_ssh_public_key" "portfolio" {
  name                = "linuxboxsshkey"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = var.ssh_key_public
}

resource "azurerm_linux_virtual_machine" "portfolio" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminivan"
  network_interface_ids = [
    azurerm_network_interface.portfolio.id
  ]

  admin_ssh_key {
    username   = "adminivan"
    public_key = azurerm_ssh_public_key.portfolio.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "portfolio" {
  name                 = "custom_script_extension"
  virtual_machine_id   = azurerm_linux_virtual_machine.portfolio.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
 {
  "fileUris": [
    "${var.install_script_url}"
  ]
,"commandToExecute": "sudo bash install-app.sh"
 }
SETTINGS

}