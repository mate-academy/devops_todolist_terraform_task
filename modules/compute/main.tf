locals {
  rendered_script = replace(var.custom_script_content, "\r", "")
}

resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_ssh_public_key" "this" {
  name                = "linuxboxsshkey"
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = var.ssh_key_public
}

resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = "azureuser"

  network_interface_ids = [azurerm_network_interface.this.id]

  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = azurerm_ssh_public_key.this.public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

resource "azurerm_virtual_machine_extension" "app_install" {
  name                 = "app-install"
  virtual_machine_id   = azurerm_linux_virtual_machine.this.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  protected_settings = jsonencode({
    script = base64encode(local.rendered_script)
  })
}
