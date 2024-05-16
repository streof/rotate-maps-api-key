terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.103"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.49"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.29"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "azurerm" {
  features {
     key_vault {
       purge_soft_delete_on_destroy    = true
       recover_soft_deleted_key_vaults = true
    }
  }
}
# provider "azuread" {}

provider "google" {
  project = var.gcp_default_project_id
  region  = var.gcp_region
}

provider "github" {
  owner      = var.github_owner
}
