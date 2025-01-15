# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  for_each = toset([ "eastus", "westeurope", "westus" ])
  name = "myrg-${each.value}"
  location = each.key 
}
/* 
we can also use each.value as each.key = each.value 
in this case  
*/