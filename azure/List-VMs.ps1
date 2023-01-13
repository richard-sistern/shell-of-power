# Playing with ChatGPT
# - Write a powershell script to get all the VMs in azure
# - Please use functions and make it modular
# - Please merge connect-azure and select-subscription one function
# - Now merge Get-VMs and Print-VMs in one function
# - Add comments for get-help at the begining of the function

Function Connect-Azure {
    <#
    .SYNOPSIS
    Connects to your Azure account

    .OUTPUTS
    Connects to your Azure account
    #>
    # Connect to your Azure account
    Connect-AzAccount
}

Function Select-AzureSubscription {
    <#
    .SYNOPSIS
    Selects an Azure subscription

    .PARAMETER subscriptionId
    The id of the subscription that you want to select

    .OUTPUTS
    Selects an Azure subscription
    #>
    param(
        [parameter(Mandatory=$true)]
        [string]$subscriptionId
    )
    # Select the Azure subscription
    Select-AzSubscription -SubscriptionId $subscriptionId
}

Function Get-And-Select-AzureVMs {
    <#
    .SYNOPSIS
    Gets all the VMs in the selected Azure subscription and selects the names of VMs in the selected Azure subscription

    .OUTPUTS
    Returns the names of all the VMs in the selected Azure subscription
    #>
    # Get all the VMs in the subscription
    $vms = Get-AzVM
    # Display the VM names
    $vms | Select-Object -ExpandProperty Name
}

# Connect to Azure
Connect-Azure

# Select Azure subscription
$subscriptionId = (Get-AzSubscription | Out-GridView -Title "Select an Azure Subscription" -PassThru).SubscriptionId
Select-AzureSubscription -subscriptionId $subscriptionId

# Get and Select Azure VMs
Get-And-Select-AzureVMs
