# Verify Access - Azure Deployment Script

## Summary

This repo contains the set of IAC deployment scripts to test the deployment capability for Azure environments

## Prerequisites

- Azure account access to run these deployments (request access from DJAGIT for Azure permissions)
- AzureRM powershell modules: https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps
  - `Install-Module AzureRM`
  - `Import-Module AzureRM`

## Test Deployment

Navigate to the environment folder you wish to deploy for

- To deploy the VMs run the script named `verify_access.ps1`