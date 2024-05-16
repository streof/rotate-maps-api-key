variable "github_repository" {
  description = "The GitHub repository name."
  type        = string
}

variable "github_owner" {
  description = "The GitHub owner (user or organization) of the repository."
  type        = string
}

variable "gcp_service_account_key" {
  description = "The GCP service account key."
  type        = string
  sensitive   = true
}

variable "gcp_service_account_email" {
  description = "The GCP service account email."
  type        = string
}

variable "azure_client_id" {
  description = "The Azure client ID."
  type        = string
  sensitive   = true
}

variable "azure_client_secret" {
  description = "The Azure client secret."
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "The Azure tenant ID."
  type        = string
  sensitive   = true
}

variable "azure_subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "azure_key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "azure_maps_key_name" {
  description = "Google Maps API key name in Azure Key Vault."
  type        = string
}
