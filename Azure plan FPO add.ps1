# Script to streamline FPO adding for new Pax8 Subscriptions
# Information needed: Tenant ID, Subscription ID, admin creds for the tenant. Subscription ID will be available after Pax8 creates the plan.
# The FPO added is for United States. Do not use this script if it is for a foreign org/region.
# Must have AZ powershell module installed

#Requires -Modules Az

param (
    [Parameter(Mandatory=$true)]
    [string]$TenantID,
    [Parameter(Mandatory=$true)]
    [Switch]$SubscriptionID
)

$Pax8Object = "a2e74e5e-7fca-4a63-9a6c-c2e073055435"

Write-Host "This script will make Pax8 a contributor to the specified Azure Plan subscription. Press enter to continue, ctrl+c to cancel."
Pause
Write-Host "Your default browser will launch and prompt you to log in with admin credentials for the customer.
 If you have cookie/cache issues, copy and paste the URI into an incognito window."

Import-Module Az.Accounts

Connect-AzAccount -Tenant $TenantID -SubscriptionId $SubscriptionID

New-AzRoleAssignment -ObjectId 'a2e74e5e-7fca-4a63-9a6c-c2e073055435' -RoleDefinitionName 'Contributor' -Scope "/subscriptions/$subscriptionID"

Disconnect-AzAccount