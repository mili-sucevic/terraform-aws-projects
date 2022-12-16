# INSTANCE MODULE

## AWS Provider
provider "aws" {
  region  = var.region
  profile = var.profile
}

## EC2 Keypair
resource "aws_key_pair" "ec2_key" {
  key_name   = "public_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

## EC2 Web Instance
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_pair_name

  tags = {
    Name = "webserver"
  }
}

# AWS Instance EIP
resource "aws_eip" "ec2_eip" {
  vpc      = true
  instance = aws_instance.web.id
}
