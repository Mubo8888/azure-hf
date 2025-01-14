# Terraform Block
terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "1.44.0"
      #version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.1.0"
    }
  }
}

# Provider Block
provider "azurerm" {
   features {}
   subscription_id = "eee0563a-6259-42f3-b289-6d201645b2b5"  
   client_id = "8aea866f-3a4f-45b2-8eca-2058d1d7c977"
   client_secret = "to_include"  
   tenant_id =  "82121e4c-9dc6-42ff-a26f-222dbc796cc6" 
}


