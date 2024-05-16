resource "google_project" "gcp_maps_project" {
  name            = var.gcp_maps_project_name
  project_id      = var.gcp_maps_project_id
  billing_account = var.gcp_billing_account_id

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_project_service" "enable_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "apikeys.googleapis.com",
  ])
  project = google_project.gcp_maps_project.project_id
  service = each.key

  disable_on_destroy = false
}

resource "google_service_account" "service_account" {
  account_id   = var.gcp_maps_service_account_name
  display_name = "Terraform Service Account"
  project      = google_project.gcp_maps_project.project_id
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = google_service_account.service_account.name

  lifecycle {
     create_before_destroy = true
     prevent_destroy = false
   }
}

resource "google_project_iam_member" "apikeys_admin" {
  project = google_project.gcp_maps_project.project_id
  role    = "roles/serviceusage.apiKeysAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
