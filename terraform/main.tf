
locals {
  project_name = "capstone"
  common_tags = {
    Project     = "IADT Capstone"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

# Example data source to fetch the current AWS region dynamically
data "aws_region" "current" {}

# Example data source to fetch the current AWS account ID dynamically
data "aws_caller_identity" "current" {}
