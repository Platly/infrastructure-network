bucket       = "platly-terraform-production"
key          = "infrastructure-network/terraform.tfstate"
use_lockfile = true
kms_key_id   = "alias/aws/s3"
encrypt      = true