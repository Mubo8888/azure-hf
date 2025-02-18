# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstatembo202501"
    container_name        = "tfstatefiles"
    key                   = "app1-terraform.tfstate"
  } 
}

# Provider Block
provider "azurerm" {
   features {}
   subscription_id = "eee0563a-6259-42f3-b289-6d201645b2b5"
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}


