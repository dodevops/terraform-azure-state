# Terraform state management (for Azure)

## Introduction

This module manages storage for Terraform states and is usually used in the Terraform "state" module as a base
for other modules' backend configuration.

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "state" {
  source = "dodevops/state/azure"
  version = "<version>"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- terraform (>=1.0.0)

- azurerm (>=4.0.0)

## Providers

The following providers are used by this module:

- azurerm (>=4.0.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_storage_account.storage-account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) (resource)
- [azurerm_storage_container.storage-container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) (resource)

## Required Inputs

The following input variables are required:

### location

Description: The azure location used for azure

Type: `string`

### project

Description: Three letter project key

Type: `string`

### resource\_group

Description: Name of the resource group to use

Type: `string`

### stage

Description: Name of the stage for this state

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### delete\_retention\_policy

Description: Days until soft deleted resources are hard deleted

Type: `number`

Default: `7`

### tags

Description: Map of tags for the resources

Type: `map(any)`

Default: `{}`

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Development

Use [the terraform module tools](https://github.com/dodevops/terraform-module-tools) to check and generate the documentation by running

    docker run -v "$PWD":/terraform ghcr.io/dodevops/terraform-module-tools:latest
