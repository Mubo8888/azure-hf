/*
# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags = local.common_tags
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = local.snet_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
*/
# Create Virtual Network and Subnets using Terraform Public Registry Module
module "avm-res-network-virtualnetwork" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  version             = "0.7.1"
  address_space       = ["10.0.0.0/16"]
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  subnets             = {
                          subnet01 = {
                            name = "subnet01"
                            address_prefixes = ["10.0.1.0/24"]
                          }
                          subnet02 = {
                            name = "subnet02"
                            address_prefixes = ["10.0.2.0/24"]
                            service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]
                          }
                          subnet03 = {
                            name = "subnet03"
                            address_prefixes = ["10.0.3.0/24"]
                            service_endpoints = ["Microsoft.AzureActiveDirectory"]
                          }
                        }
  }

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = local.pip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label = "app1-${terraform.workspace}-${random_string.myrandom.id}"
  tags = local.common_tags
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  name                = local.nic_name
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    #subnet_id                    = azurerm_subnet.mysubnet.id       
    subnet_id                     = module.avm-res-network-virtualnetwork.subnets.subnet01.resource_id      
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id 
  }
  tags = local.common_tags
}
