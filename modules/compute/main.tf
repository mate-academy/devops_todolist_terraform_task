resource "azurerm_network_interface" "main" {
  name                = local.nic_name
  resource_group_name = var.comp_resource_group_name
  location            = var.comp_location

  ip_configuration {
    name                          = var.comp_nic_ip_conf_name
    subnet_id                     = var.comp_nic_subnet_id
    private_ip_address_allocation = var.comp_nic_private_ip_allocation
    private_ip_address            = (var.comp_nic_private_static_ip != "" ? var.comp_nic_private_static_ip : null)
    public_ip_address_id          = var.comp_pubip_id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = var.comp_vm_name
  resource_group_name             = var.comp_resource_group_name
  location                        = var.comp_location
  size                            = var.comp_vm_size
  admin_username                  = var.comp_vm_user_name
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.main.id, ]

  os_disk {
    name                 = var.comp_vm_os_disk_name
    caching              = "ReadWrite"
    disk_size_gb         = var.comp_vm_os_disk_size
    storage_account_type = var.comp_vm_os_disk_strg_acc_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.comp_vm_user_name
    public_key = file("~/.ssh/id_rsa.pub")
  }
}

resource "azurerm_virtual_machine_extension" "example" {
  name                 = "custom_script_extension"
  virtual_machine_id   = azurerm_linux_virtual_machine.main.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
    {
      "fileUris": ["${var.comp_custom_script_url}"],
      "commandToExecute": "bash ${var.comp_custom_script_filename}"
    }
  SETTINGS
}
