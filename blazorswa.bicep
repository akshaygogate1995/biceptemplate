param location string = resourceGroup().location
param name string = uniqueString(resourceGroup().id)

 
param githubRepositoryUrl string
param appLocation string 
param apiLocation string 
param outputLocation string 

resource asw_BlazorApp 'Microsoft.Web/staticSites@2022-09-01' = {
  name: '${name}_BlazorApp'
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: githubRepositoryUrl
    branch: 'main'  // Update with your desired branch
    appArtifactLocation: appLocation
    apiArtifactLocation: apiLocation
    outputLocation: outputLocation
    apiType: 'FunctionApp'  // This assumes you have Azure Functions in your Blazor app
    publishCredential: {
      actionName: 'Bicep Deploy'  // Update as needed
    }
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}
