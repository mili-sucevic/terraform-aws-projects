terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "DUMMY_VALUE_AMI_ID"
  subnet_id     = "DUMMY_VALUE_SUBNET_ID"
  instance_type = "t2.micro"

  tags = {
    Name = "Batman"
  }
}
