<#
.SYNOPSIS
    Sample PowerShell runbook that lists Azure Resource Groups.
.DESCRIPTION
    This runbook connects to Azure and enumerates all resource groups.
#>

param (
    [Parameter(Mandatory=$false)]
    [string]$AzureSubscriptionId
)

# Connect to Azure
Write-Output "**Authenticating** to Azure..."
Connect-AzAccount -Identity

# Select Subscription if passed
if ($AzureSubscriptionId) {
    Write-Output "**Switching** to subscription: $AzureSubscriptionId"
    Set-AzContext -SubscriptionId $AzureSubscriptionId
}

# Get Resource Groups
Write-Output "**Fetching** Resource Groups..."
$resourceGroups = Get-AzResourceGroup

Write-Output "**Found** the following Resource Groups:"
$resourceGroups | ForEach-Object {
    Write-Output $_.ResourceGroupName
}

Write-Output "**Runbook Completed**."
