# Makefile for Terraform workflows

TF ?= terraform
TF_DIR ?= .

init: ## Initialize Terraform
	@echo "🔧 Initializing Terraform..."
	cd $(TF_DIR) && $(TF) init -input=false

validate: ## Validate Terraform configuration
	@echo "✅ Validating Terraform files..."
	cd $(TF_DIR) && $(TF) validate -no-color

plan: ## Show Terraform plan
	@echo "📝 Creating execution plan..."
	cd $(TF_DIR) && $(TF) plan -no-color -input=false

apply: ## Apply Terraform changes
	@echo "🚀 Applying Terraform changes..."
	cd $(TF_DIR) && $(TF) apply -auto-approve

destroy: ## Destroy Terraform-managed infrastructure
	@echo "💥 Destroying Terraform resources..."
	cd $(TF_DIR) && $(TF) destroy -auto-approve

fmt: ## Format Terraform code
	@echo "🎨 Formatting Terraform code..."
	cd $(TF_DIR) && $(TF) fmt -recursive -check

lint: format validate ## Format + Validate

output: ## Show Terraform outputs
	@echo "📤 Terraform outputs:"
	cd $(TF_DIR) && $(TF) output

clean: ## Clean up .terraform and tfstate files
	@echo "🧹 Cleaning up Terraform cache files..."
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate* crash.log

help: ## Show this help message
	@echo "📖 Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'