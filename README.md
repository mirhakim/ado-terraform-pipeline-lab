# ado-terraform-pipeline-lab

A hands-on lab showing how to use Terraform (HCL) together with Azure DevOps (ADO) pipelines to implement CI/CD for infrastructure as code.

Repository language composition: 100% HCL (Terraform).

## Overview

This repository contains Terraform configurations and pipeline sample patterns designed to teach and demonstrate:
- Structuring Terraform code for reuse and clarity
- Using a remote backend (Azure Storage) for state and locking
- Creating Azure DevOps pipelines that run `terraform plan` and `terraform apply`
- Handling secrets and service connections in ADO
- Promoting changes through pipeline stages (e.g., dev → staging → prod)

Use this lab to learn practical pipeline setups and to adapt the examples for your own Azure projects.

## Key Features

- All infrastructure described in HCL (Terraform) files
- Example pipeline YAMLs for Azure DevOps (planned/approved applies)
- Remote state examples (Azure Storage) and locking
- Guidance on variable management, secret handling, and Workspaces
- Useful for workshops, demos, and onboarding engineers to IaC CI/CD

## Prerequisites

- Azure subscription with rights to create resource groups, storage accounts, and service principals
- Azure DevOps organization and project
- Terraform (recommended version recorded in each module’s README)
- Azure CLI or equivalent for creating service principals and resources

## Quick start

1. Clone the repo:
   ```bash
   git clone https://github.com/mirhakim/ado-terraform-pipeline-lab.git
   cd ado-terraform-pipeline-lab
   ```

2. Read the module or example folder you want to try (each example has its own README).

3. Create or configure an Azure Storage account and container for remote state, and create a service principal for the pipeline to use.

4. Configure an Azure DevOps service connection (Service Principal) and variable group or pipeline secrets to store:
   - `ARM_CLIENT_ID`
   - `ARM_CLIENT_SECRET`
   - `ARM_SUBSCRIPTION_ID`
   - `ARM_TENANT_ID`
   - Storage account access or SAS token for state (if applicable)

5. Import the example pipeline YAML into your Azure DevOps pipeline and run it. Pipelines are designed to:
   - Run `terraform init`
   - Run `terraform plan` and publish plan artifacts
   - Require manual approval for `terraform apply` (configurable)

## Repository layout (suggested)

- /examples/            — Example Terraform projects and pipeline YAMLs
- /modules/             — Reusable Terraform modules
- /pipelines/           — Azure DevOps pipeline YAML files and templates
- /docs/                — Lab instructions, diagrams, and troubleshooting notes

(If any of these directories are absent, add them as you build examples.)

## Best practices illustrated

- Keep state remote and locked using Azure Storage + blob locking
- Separate environments using workspaces, separate state containers, or entirely separate subscriptions
- Keep credentials out of code — use ADO variable groups and service connections
- Use plan artifacts and require approvals before apply in CI/CD
- Modularize Terraform code for reuse and testing

## Contributing

Contributions, enhancements, and additional pipeline patterns are welcome. Please:
1. Open an issue describing the change or idea.
2. Submit a PR with tests or an example demonstrating the change.
3. Keep changes focused and include documentation in `/docs` or the example folder.

## License

Add your preferred license file (e.g., MIT, Apache-2.0) to the repository root.

## Contact

Repo owner: @mirhakim — open issues or PRs for questions or suggestions.
