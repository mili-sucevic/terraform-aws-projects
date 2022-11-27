terraform {
  backend "remote" {
    organization = "Mili-ACG-Terraform-Labs"
    workspaces {
      name = "lab-migrate-state"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "vm" {
  ami           = "ami-02b972fec07f1e659"
  subnet_id     = "subnet-05bfa59d4204a524e"
  instance_type = "t3.micro"
  tags = {
    Name = "my-first-tf-node"
  }
}
