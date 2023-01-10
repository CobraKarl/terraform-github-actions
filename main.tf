terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.91.0"
    }
  }
  // the backend needs to be deployed after the infrastructure
  backend "azurerm" {
    resource_group_name  = "mkk15"
    storage_account_name = "storageforstate0822"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    
  }
}

provider "azurerm" {
    features {
      
    }
  
}

data "azurerm_client_config" "current" {
  
}

# Create RG
resource "azurerm_resource_group" "mkk16" {
    name = "mkk16"
    location = "northeurope" 
}

# Create VNET
resource "azurerm_virtual_network" "vnet" {
    name = "vnet"
    resource_group_name = azurerm_resource_group.mkk16.name
    location = azurerm_resource_group.mkk16.location
    address_space = [ "10.0.0.0/16" ]
  
}

# Create Subnet
resource "azurerm_subnet" "subnet1" {
    name = "subnet1"
    resource_group_name = azurerm_resource_group.mkk16.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = [ "10.0.1.0/24" ]
  
}
