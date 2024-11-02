resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linuxboxpip.id
  }
}

resource "azurerm_public_ip" "linuxboxpip" {
  name                = "linuxboxpip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_virtual_machine" "main" {
  name                             = "matebox"
  location                         = var.location
  resource_group_name              = var.resource_group_name
  network_interface_ids            = [azurerm_network_interface.main.id]
  vm_size                          = "Standard_B1s"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  os_profile {
    computer_name  = "todoappserver"
    admin_username = "adminuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
    path     = "/home/adminuser/.ssh/authorized_keys"
    key_data = var.ssh_key
    }
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  tags = {
    environment = "staging"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_virtual_machine_extension" "CustomScript" {
  name                       = "CustomScript"
  virtual_machine_id         = azurerm_virtual_machine.main.id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = "2.0"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
{
  "fileUris": ["https://lvkzxjncklvjn.blob.core.windows.net/task-artifacts/install-app.sh"],
  "commandToExecute": "bash install-app.sh",
  "skipDos2Unix": true
}
SETTINGS
}
