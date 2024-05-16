# This is required in when using the GitHub provider in modules
# https://github.com/integrations/terraform-provider-github/issues/876#issuecomment-1303790559

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
    }
  }
}

resource "github_repository" "repo" {
  name         = var.github_repository
  description  = "GitHub workflow for rotating Google Maps API keys"
  homepage_url = "https://github.com/streof/rotate-maps-api-key"
  visibility   = "public"
  has_issues   = true
  has_wiki     = false
  has_projects = false
  auto_init    = true
}

resource "github_branch" "main" {
  repository = github_repository.repo.name
  branch     = "main"
}

resource "github_branch_default" "default"{
  repository = github_repository.repo.name
  branch     = github_branch.main.branch
}

resource "github_repository_file" "rotate_key_workflow" {
  repository          = github_repository.repo.name
  branch              = "main"
  file                = ".github/workflows/rotate-key.yaml"
  content             = file("${path.module}/rotate-key.yaml")
  commit_message      = "Add rotate key workflow"
  overwrite_on_create = true
}

resource "github_actions_secret" "gcp_service_account_key" {
  repository      = var.github_repository
  secret_name     = "GCP_SERVICE_ACCOUNT_KEY"
  plaintext_value = var.gcp_service_account_key
}

resource "github_actions_secret" "gcp_service_account_email" {
  repository      = var.github_repository
  secret_name     = "GCP_SERVICE_ACCOUNT_EMAIL"
  plaintext_value = var.gcp_service_account_email
}

resource "github_actions_secret" "azure_client_id" {
  repository     = var.github_repository
  secret_name    = "AZURE_CLIENT_ID"
  plaintext_value = var.azure_client_id
}

resource "github_actions_secret" "azure_client_secret" {
  repository     = var.github_repository
  secret_name    = "AZURE_CLIENT_SECRET"
  plaintext_value = var.azure_client_secret
}

resource "github_actions_secret" "azure_tenant_id" {
  repository     = var.github_repository
  secret_name    = "AZURE_TENANT_ID"
  plaintext_value = var.azure_tenant_id
}

resource "github_actions_secret" "azure_subscription_id" {
  repository     = var.github_repository
  secret_name    = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = var.azure_subscription_id
}

resource "github_actions_secret" "azure_key_vault_name" {
  repository     = var.github_repository
  secret_name    = "AZURE_KEY_VAULT_NAME"
  plaintext_value = var.azure_key_vault_name
}

resource "github_actions_secret" "azure_maps_key_name" {
  repository     = var.github_repository
  secret_name    = "AZURE_MAPS_KEY_NAME"
  plaintext_value = var.azure_maps_key_name
}
