# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg1" {
  name = "myrg-1"
  location = "West Europe"
}

# Resource-2: Random String 
resource "random_string" "myrandom" {
  length = 16
  upper = false 
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.myrg1.name
  location                 = azurerm_resource_group.myrg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # account_encryption_source = "Microsoft.Storage"

  tags = {
    environment = "staging"
  }
}