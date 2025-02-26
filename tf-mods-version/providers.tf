terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "joel-tm"
    key     = "joel-tm/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
    # dynamodb_table = "your-terraform-lock-table"
  }
}

provider "aws" {
  region = var.aws_region

  # If you need to assume a role
  # assume_role {
  #   role_arn     = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
  #   session_name = "TerraformSession"
  # }

  default_tags {
    tags = {
      Environment = "joel-sandbox"
      Owner       = "jo"
      Project     = "tm"
    }
  }
}
