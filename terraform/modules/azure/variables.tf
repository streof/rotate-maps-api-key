variable "azure_resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "azure_key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "azure_maps_key_name" {
  description = "Google Maps API key name in Azure Key Vault."
  type        = string
}
