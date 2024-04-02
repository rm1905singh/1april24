terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }

}

provider "azurerm" {
  features {

  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rm-rgs"
    storage_account_name = "rmca11"
    container_name       = "rmca12"
    key                  = "devtf.tfstate"
  }
}
