output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
  value = data.azurerm_client_config.current.subscription_id
}

output "azure_client_id" {
  # NOTE: This should be the client ID of the application
  value = azuread_application.google_maps_app.client_id
}

output "azure_client_secret" {
  value = azuread_service_principal_password.google_maps_sp_password.value
}
