# These are passed on to the github module
output "service_account_key" {
  value     = google_service_account_key.service_account_key.private_key
}

output "service_account_email" {
  value = google_service_account.service_account.email
}
