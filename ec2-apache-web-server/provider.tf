terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  region  = var.region
  profile = var.profile
}