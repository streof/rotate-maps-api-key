# Azure variables
variable "azure_resource_group_name" {
  description = "The name of the resource group containing the Key Vault."
  type        = string
}

variable "azure_key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

# GCP variables
variable "gcp_default_project_id" {
  description = "The ID of the default GCP project used to create new projects."
  type        = string
}

variable "gcp_billing_account_id" {
  description = "The ID of the billing account to associate with the new project."
  type        = string
}

variable "gcp_maps_project_id" {
  description = "The ID for the new GCP Maps project."
  type        = string
}

variable "gcp_maps_project_name" {
  description = "The name for the new GCP Maps project."
  type        = string
}

variable "gcp_maps_service_account_name" {
  description = "The name for the new GCP Maps service account."
  type        = string
}

variable "azure_maps_key_name" {
  description = "Google Maps API key name in Azure Key Vault."
  type        = string
}

variable "gcp_region" {
  description = "The GCP region."
  type        = string
  default     = "europe-west4"
}

variable "github_owner" {
  description = "The GitHub owner (user or organization) of the repository."
  type        = string
}

variable "github_repository" {
  description = "The GitHub repository name."
  type        = string
}
