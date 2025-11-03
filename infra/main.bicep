@description('Región donde se crearán los recursos')
param location string = 'eastus'

@description('Nombre del App Service Plan')
param appServicePlanName string = 'asp-iva-dev'

@description('Nombre de la Web App')
param webAppName string = 'app-iva-dev'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'   // plan gratuito. Puedes cambiar a B1 si quieres algo pagado.
    tier: 'Free'
    size: 'F1'
    capacity: 1
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
