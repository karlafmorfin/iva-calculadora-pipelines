param appServicePlanName string
param webAppName string
param location string = resourceGroup().location
param skuName string = 'F1'

@description('App Service Plan (Windows) for hosting the Web App')
resource plan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: skuName
  }
}

@description('Windows Web App that will host static HTML content')
resource site 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
  }
  tags: {
    project: 'iva-calculadora'
    provisionedBy: 'bicep'
  }
}

output webAppUrl string = 'https://${site.name}.azurewebsites.net'
