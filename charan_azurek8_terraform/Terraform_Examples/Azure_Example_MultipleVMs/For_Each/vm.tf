resource "azurerm_windows_virtual_machine" "main" {
  for_each                        = var.vms 
  name                            = each.key
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = each.value
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd1234!"
  network_interface_ids           = [azurerm_network_interface.nic1[each.key].id]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2012-R2-Datacenter"
    version   = "latest"
  }

  os_disk {
    name                 = "${each.key}-osdisk"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}