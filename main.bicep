param resourceGroupName string = 'YourResourceGroup'
param location string = 'eastus2'

// Parameters for existing Bicep files
param storageAccountName string = 'yourstorage1001me'
param functionAppName string = 'yourfun100195'
param asw_BlazorApp_name string = 'BlazorApp'
param githubRepositoryUrl string = 'https://github.com/yourusername/your-blazor-app-repo'
param appLocation string = 'src/BlazorApp'
param apiLocation string = 'src/Api'
param outputLocation string = 'dist'
param vnetName string = 'MyVNet'
param addressPrefix string = '10.0.0.0/16'
param subnetName string = 'MySubnet'
param subnetPrefix string = '10.0.0.0/24'

// Additional parameters specific to your deployment
param someParameter string = 'someValue'

// Importing the three existing Bicep files
module functionApp './func_storage.bicep' = {
  name: 'functionAppModule'
  params: {
    storageAccountName: storageAccountName
    functionAppName: functionAppName
    location: location
  }
}

module staticWebApp './blazorswa.bicep' = {
  name: 'staticWebAppModule'
  params: {
    location: location
    name: asw_BlazorApp_name
    githubRepositoryUrl: githubRepositoryUrl
    appLocation: appLocation
    apiLocation: apiLocation
    outputLocation: outputLocation
  }
}

module vnet './vnet.bicep' = {
  name: 'vnetModule'
  params: {
    vnetName: vnetName
    addressPrefix: addressPrefix
    subnetName: subnetName
    subnetPrefix: subnetPrefix
  }
}

// Outputs from the three modules
output functionAppUrl string = functionApp.outputs.functionAppUrl

output vnetId string = vnet.outputs.vnetId

// Additional outputs specific to your deployment
output someOutput string = someParameter
