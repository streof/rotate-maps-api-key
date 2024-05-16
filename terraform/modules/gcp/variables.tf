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
