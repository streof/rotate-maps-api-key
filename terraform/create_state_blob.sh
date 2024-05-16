#!/bin/bash

subscription_id=$(az account show --query id -o tsv)
resource_group_name="GoogleMapsAPIKey"
storage_account_name="googlemapsapikey"
container_name="terraformstate"
location="westeurope"

# Prevent subscription not found errors
az provider register --namespace Microsoft.Storage

# Ensure the subscription is set
az account set --subscription $subscription_id

# Create a resource group
az group create --name $resource_group_name --location $location

# Create the storage account
az storage account create \
  --name $storage_account_name \
  --resource-group $resource_group_name \
  --location $location \
  --sku Standard_LRS

# Get storage account key
account_key=$(az storage account keys list \
  --resource-group $resource_group_name \
  --account-name $storage_account_name \
  --query '[0].value' -o tsv)

# Create a blob container
az storage container create \
  --name $container_name \
  --account-name $storage_account_name \
  --account-key $account_key

# Enable versioning required for recovery
az storage account blob-service-properties update \
--account-name $storage_account_name \
--resource-group $resource_group_name \
--enable-versioning
