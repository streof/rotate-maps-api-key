data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "google_maps_api_key" {
  name = var.azure_resource_group_name
}

resource "azurerm_key_vault" "kv" {
  name                = var.azure_key_vault_name
  location            = data.azurerm_resource_group.google_maps_api_key.location
  resource_group_name = var.azure_resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  # Can be enabled if required
  # enabled_for_deployment          = true
  # enabled_for_disk_encryption     = true
  # enabled_for_template_deployment = true

  enable_rbac_authorization  = true
  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  sku_name = "standard"
}

resource "azuread_application" "google_maps_app" {
  display_name = "google-maps-app"
}

resource "azuread_service_principal" "google_maps_sp" {
  client_id = azuread_application.google_maps_app.client_id
}

resource "azuread_service_principal_password" "google_maps_sp_password" {
  service_principal_id = azuread_service_principal.google_maps_sp.id
}

resource "azurerm_role_assignment" "current_user_kv_role_assignment" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "google_maps_kv_role_assignment" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = azuread_service_principal.google_maps_sp.id
}

resource "azurerm_key_vault_secret" "google_map_key" {
  name         = var.azure_maps_key_name
  value        = "default_value"
  key_vault_id = azurerm_key_vault.kv.id

  lifecycle {
    ignore_changes = [
      tags,
      value,
    ]
  }
}
