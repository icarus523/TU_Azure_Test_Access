# Test deploy script to see if account has been configured correctly

# This script will deploy a Ubuntu 16-04 LTS Server in Azure and automatically remove it. 
$subscriptionId = "bb1dd1e3-b731-4239-a1a0-fa1a52457b46"
$resourceGroupName = "test_resource_group_$env:UserName"
$resourceGroupLocation = "Australia East"
$deploymentName = $resourceGroupName

$vmTemplateFilePath = Join-Path $PSScriptRoot "test_templates\template.json"
$vmParametersFilePath = Join-Path $PSScriptRoot "test_templates\parameters.json"

# Test Account for Azure Access
_common\azure_verify_login.ps1

# Test Account for the ability to create resource groups
_common\azure_deploy_template.ps1 $subscriptionId $resourceGroupName $resourceGroupLocation $deploymentName $vmTemplateFilePath $vmParametersFilePath

# Tag Resource Group
Set-AzureRmResourceGroup -Name $resourceGroupName -Tag @{Department="DJAG";businessowner="OLGR";"Business Unit"="OLGR";application="Test Access";Environment="DEVEL";infoclassification="XXXXX"}

Write-Host "$resourceGroupName has been successfully deployed" 

Remove-AzureRmResourceGroup -Name "test_resource_group_$env:UserName"
Write-Host "$resourceGroupName has been successfully removed" 
