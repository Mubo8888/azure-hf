# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
  }
}

# Provider Block
provider "azurerm" {
 features {}  
 subscription_id = "eee0563a-6259-42f3-b289-6d201645b2b5"        
}


