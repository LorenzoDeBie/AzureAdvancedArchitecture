# Module 0 Part 2: Deploying Resources

# To prepare for the next exercises, you will need to deploy a resource group and an Azure API Management (APIM) resource.
# This process can take some time, so it's best to start it early!

#----------------------------------------------------------------------------------------------------------------------
# Step 1: Create a Resource Group
# Use the following command to create a new resource group. Replace `<email-resource-group>` with your desired name and `<resource-group-location>` with the appropriate Azure region (e.g., `westeurope`):

$emailResourceGroup = 'AzureLorenzo'

# List all Azure locations. Select one that is close to you.
az account list-locations -o table

$location = 'West Europe'

# Commented Out because Resource Group already Exists
# az group create --name $emailResourceGroup --location $location

#----------------------------------------------------------------------------------------------------------------------
# Step 2: Deploy an Azure API Management Resource (APIM)

# Deploy an APIM resource within your resource group. Replace the placeholders with your desired values:

$apimName = 'Lorenzo-APIM'

# This is for receiving notifications about API subscriptions.
# It won't be used for this exercise but you need to set it to create the resource.
$publisherName = 'Lorenzo-Publisher'
$publisherEmail = 'lorenzo.debie@axxes.com'

az apim create `
  --name $apimName `
  --resource-group $emailResourceGroup `
  --publisher-name $publisherName --publisher-email $publisherEmail `
  --no-wait

# It take a while for the APIM resource to be fully deployed and provisioned.
# You can check the status by running the following command:
az apim show `
  --name $apimName `
  --resource-group $emailResourceGroup `
  --query 'provisioningState'
