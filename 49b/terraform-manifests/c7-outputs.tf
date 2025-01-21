# Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  # Atrribute Reference
  value = azurerm_resource_group.myrg.id 
}
output "resource_group_name" {
  description = "Resource Group name"
  # Argument Reference
  value = azurerm_resource_group.myrg.name  
}

# Output Values - Virtual Machine
output "vm_public_ip_address" {
  description = "My Virtual Machine Public IP"
  value = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
}

# Output Values - Virtual Network
# virtual_network_name
output "virtual_network_name" {
  description = "Virtual Network Name"
  value = module.avm-res-network-virtualnetwork.name
}
# virtual_network_id
output "virtual_network_id" {
  description = "Virtual Network ID"
  value = module.avm-res-network-virtualnetwork.resource_id
}
# virtual_network_subnets
output "virtual_network_subnets" {
  description = "Virtual Network Subnets"
  value = module.avm-res-network-virtualnetwork.subnets
}  
# virtual_network_location
output "virtual_network_location" {
  description = "Virtual Network Location"
  value = module.avm-res-network-virtualnetwork.resource.location
}  
# virtual_network_address_space

output "virtual_network_address_space" {
  description = "Virtual Network Address Space"
  value = module.avm-res-network-virtualnetwork.resource.body.properties.addressSpace.addressPrefixes
  #value = module.avm-res-network-virtualnetwork.resource.output.properties.addressPrefixes
}
/*
output "virtual_network" {
  description = "Virtual Network"
  value = module.avm-res-network-virtualnetwork.resource
}  
*/
