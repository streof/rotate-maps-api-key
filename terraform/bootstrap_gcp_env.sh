#!/bin/bash

# Retrieve the GCP billing account ID and default project ID
billing_account_id=$(gcloud beta billing accounts list --format="value(ACCOUNT_ID)" | head -n 1)
default_project_id=$(gcloud projects list --format="value(PROJECT_ID)" | head -n 1)

# Check if the billing account ID and default project ID are retrieved
if [ -z "$billing_account_id" ]; then
  echo "Error: No billing account ID found."
  exit 1
fi

if [ -z "$default_project_id" ]; then
  echo "Error: No project ID found."
  exit 1
fi

# Export environment variables for Terraform
export TF_VAR_gcp_default_project_id=$default_project_id
export TF_VAR_gcp_billing_account_id=$billing_account_id

echo "Environment variables TF_VAR_gcp_default_project_id and TF_VAR_gcp_billing_account_id are set and not empty."
