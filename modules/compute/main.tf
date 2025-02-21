resource "azurerm_network_interface" "vm-nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = azurerm_public_ip.linuxboxpip.id
  }
}

resource "azurerm_linux_virtual_machine" "matebox" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm-nic.id,
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
  name                 = "CustomScript"
  virtual_machine_id   = azurerm_linux_virtual_machine.matebox.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
    "fileUris": ["https://raw.githubusercontent.com/p1tonidze/devops_todolist_terraform_task/refs/heads/main/install-app.sh"],
    "script": "bash /home/testadmin/install-app.sh"
  }
SETTINGS

  depends_on = [azurerm_linux_virtual_machine.matebox]
}
