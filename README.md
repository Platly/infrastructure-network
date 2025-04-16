# Platly Infrastructure Network

This repository provisions a base AWS network using the [Terraform AWS VPC module](https://github.com/terraform-aws-modules/terraform-aws-vpc) and defines the foundational networking layer for all Platly workloads.

It provides a simplified, production-inspired VPC setup suitable for development and testing environments.

---

## What It Creates

- AWS VPC
- 3 public subnets (across 3 AZs)
- 3 private subnets (across 3 AZs)
- 1 NAT Gateway
- Internet Gateway for public subnets
- Route tables and associations

> This is where all Platly platform workloads will be deployed.

---

## Usage

### 1. Configure your Terraform backend and variables

Export the following variables:

```bash
# If using AWS profiles (SSO, IAM role, etc)
export AWS_PROFILE=production
export AWS_REGION=us-east-1
```

```bash
# If using secret keys
export AWS_ACCESS_KEY_ID="xxx"
export AWS_SECRET_ACCESS_KEY="xxx"
export AWS_SESSION_TOKEN="xxx"
export AWS_REGION=us-east-1
```

### 2. Run with Make

There is a Makefile to simplify the Terraform commands:

```bash
make init
make plan
make apply
```

For more information:

```bash
make help
📖 Available commands:
  apply           Apply Terraform changes
  clean           Clean up .terraform and tfstate files
  destroy         Destroy Terraform-managed infrastructure
  format          Format Terraform code
  help            Show this help message
  init            Initialize Terraform
  lint            Format + Validate
  output          Show Terraform outputs
  plan            Show Terraform plan
  validate        Validate Terraform configuration
```