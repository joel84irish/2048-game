terraform {
  required_version = ">= 1.3.0" # Update this version as needed

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
