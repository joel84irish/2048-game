# provider.tf

# Specify the provider and access details
terraform {
  required_version = {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.80.0" 
    }
  }
}
