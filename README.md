
# IVA Calculator — Infra as Code with Azure Pipelines

Este repositorio crea infraestructura con **Bicep** (App Service Plan + Web App Windows) y despliega una página HTML con **Azure Pipelines**.

## Requisitos
- Suscripción de **Azure**.
- Organización y proyecto en **Azure DevOps**.
- **Service Connection** (Azure Resource Manager, *Service Principal (Automatic)*) con permisos sobre tu suscripción o RG.

## Pasos
1. Sube este repo a GitHub o Azure Repos.
2. En Azure DevOps → **Project Settings → Service connections → New → Azure Resource Manager → Service principal (Automatic)**. Nómbralo `sc-iva-dev` y marca **Grant access permission to all pipelines**.
3. En **Pipelines → New pipeline**: elige tu repo → **Existing Azure Pipelines YAML file** → `azure-pipelines.yml`.
4. Ejecuta el pipeline. La etapa **Infra** crea RG + Plan + WebApp. La etapa **App** hace **ZIP deploy** del contenido en `web/`.
5. Abre `https://app-iva-dev.azurewebsites.net` (o el nombre que hayas puesto en `webAppName`).

## Variables
- `resourceGroup`: por defecto `rg-iva-dev`
- `location`: por defecto `eastus`
- `appServicePlanName`: `asp-iva-dev`
- `webAppName`: `app-iva-dev`
- `skuName`: `F1` (Free) o `B1` (Básico)

## Notas
- El Bicep usa **Windows** (sirve estáticos con IIS). Si quieres Linux, ajusta a `reserved: true` y define `siteConfig.linuxFxVersion`.
