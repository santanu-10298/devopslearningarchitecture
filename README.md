DevOps Learning Architecture: Azure Terraform
This repository contains a modular Terraform project designed to provision Microsoft Azure resources. 
It demonstrates best practices by utilizing a parent-child module architecture to separate resource configurations (child modules) from environment-specific deployments (parent module).
Project Structure

The project is structured into environments (e.g., dev) which contain a parentmodule that orchestrates various childmodule components.

devopslearningarchitecture/
└── dev/
    ├── childmodule/
    │   ├── azurerm_resource_group/
    │   │   ├── main.tf
    │   │   └── variable.tf
    │   └── azurerm_storage_account/
    │       ├── main.tf
    │       └── variable.tf
    └── parentmodule/
        ├── main.tf            # Calls child modules and manages dependencies
        ├── provider.tf        # Configures the hashicorp/azurerm provider (v5.0.0)
        ├── terraform.tfvars   # Defines the specific values for the resources
        └── variable.tf        # Defines input variables

        Architecture Details

Child Modules: Reusable templates for specific Azure resources. Currently, this includes modules for creating an Azure Resource Group (azurerm_resource_group) and an Azure Storage Account (azurerm_storage_account).
Parent Module: Acts as the root module for a specific environment (like dev). It calls the child modules and passes environment-specific variables.
Dependency Management: The storage account module explicitly depends on the completion of the resource group module (depends_on = [ module.azurerm_resource_group ]).

Prerequisites
Before you begin, ensure you have the following installed and configured:

Terraform (v1.x.x recommended)
Azure CLI

An active Microsoft Azure subscription.
You will need to authenticate Terraform with Azure using the Azure CLI:
az login


Configuration

The infrastructure configuration is driven by the terraform.tfvars file located in the dev/parentmodule/ directory.
Current dev configuration:
Resource Group: rayrg (Location: eastus)
Storage Account: raystg (Location: eastus, attached to rayrg)

How to Deploy

Navigate to the parent module directory:
cd dev/parentmodule


Initialize the Terraform workspace:
This command downloads the required azurerm provider (v5.0.0) and initializes the child modules.
terraform init


Review the execution plan:
This command shows you what resources Terraform will create without actually provisioning them.
terraform plan


Apply the configuration:
Execute the deployment to Azure. You will be prompted to confirm by typing yes.
terraform apply
