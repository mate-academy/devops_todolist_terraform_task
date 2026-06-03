resource "azurerm_network_interface" "nic" {
  name                = local.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location
  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_network_interface_security_group_association" "name" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_ssh_public_key" "name" {
  name                = var.ssh_key_name
  resource_group_name = var.resource_group_name
  location            = var.location
  public_key          = file(var.path_to_ssh_key)
}

resource "azurerm_linux_virtual_machine" "todo_vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_username        = var.admin_username
  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = azurerm_ssh_public_key.name.public_key
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
}

resource "azurerm_virtual_machine_extension" "name" {
  name                 = var.extension_name
  virtual_machine_id   = azurerm_linux_virtual_machine.todo_vm.id
  publisher            = var.extension_publisher
  type                 = var.extension_type
  type_handler_version = var.extension_type_handler_version
  settings             = jsonencode(var.extension_settings)
}