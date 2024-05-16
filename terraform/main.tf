module "azure" {
  source = "./modules/azure"

  azure_resource_group_name = var.azure_resource_group_name
  azure_key_vault_name      = var.azure_key_vault_name
  azure_maps_key_name       = var.azure_maps_key_name
}

module "gcp" {
  source = "./modules/gcp"

  gcp_default_project_id        = var.gcp_default_project_id
  gcp_billing_account_id        = var.gcp_billing_account_id
  gcp_maps_project_id           = var.gcp_maps_project_id
  gcp_maps_project_name         = var.gcp_maps_project_name
  gcp_maps_service_account_name = var.gcp_maps_service_account_name
}

module "github" {
  source = "./modules/github"

  github_repository         = var.github_repository
  github_owner              = var.github_owner
  gcp_service_account_key   = module.gcp.service_account_key
  gcp_service_account_email = module.gcp.service_account_email
  azure_client_id           = module.azure.azure_client_id
  azure_client_secret       = module.azure.azure_client_secret
  azure_tenant_id           = module.azure.tenant_id
  azure_subscription_id     = module.azure.subscription_id
  azure_key_vault_name      = var.azure_key_vault_name
  azure_maps_key_name       = var.azure_maps_key_name
}
