resource "azurerm_network_security_group" "mynsg" {
  name                = "my-nsg"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsgforlinuxvm" {
  network_interface_id      = azurerm_network_interface.myvmnic.id
  network_security_group_id = azurerm_network_security_group.mynsg.id
}
