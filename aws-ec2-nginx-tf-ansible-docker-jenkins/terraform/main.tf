terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_instance" "site" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  tags = {
    Name  = var.name
    group = var.group
  }
}

resource "aws_key_pair" "ec2key" {
  key_name   = "publicKey"
  public_key = file("~/.ssh/id_rsa.pub")
}