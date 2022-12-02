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
  profile = var.profile_name
}

# AWS VPC
resource "aws_vpc" "apache_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc_apache"
  }
}

# AWS Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.apache_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

# AWS Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.apache_vpc.id
  cidr_block              = var.cidr_public_subnet
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "public_subnet"
  }
}

# AWS Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.apache_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

# AWS Route Table Association
resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# AWS Key Pair
resource "aws_key_pair" "mili-keypair" {
  key_name   = "mili-keypair-webserver"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5J8M8DSMR37b37YyTCjcoKLaQPQzSsAMHN1Ol3YEJKQq9KsMXx8qua1d1MWuhr6tr+ILMP/mNnsvG90q8M6SWXavsCM6gLqSsGqCOkoYQRteR3/9VsSfkkTv1OtX37hQIsgkiWcf4C3vhfkANTokzRtOG0GG8dqMSPzbUdIEbSeGb1tMtLYFKhYgjO1Pp+mEGYrYIgBS8WX7yUW07oQVWy+smSmk8mkr6hiEacMMDuUgCea0mKRRKgZAltJiJ7Cd5sbFca+BvILQ6COSw1cYRCoFWM4Sj58ct3ClylX8PXrB9KfW1VtpqGdyKgngtZJ9shglce+ArhvDt9pHmTIB/ cloud_user@0fab1f18cc3c.mylabserver.com"
}

# EC2 Instance Definition
resource "aws_instance" "web" {
  ami             = var.aws_ami
  instance_type   = var.instance_type
  key_name        = aws_key_pair.mili-keypair.id
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "*** Completed Installing apache2"
/*
  echo "*** Installing git"
  sudo apt install git -y
  sudo service git start
  sudo service git enable
  sudo touch /var/www/html
  sudo git clone https://bitbucket.org/dptrealtime/html-web-app/src/master/ 
  cd master
  sudo mv * /var/www/html 
*/
  echo "*** Completed Installing git"
  EOF

  tags = {
    Name = "apache_web_instance"
  }

  volume_tags = {
    Name = "apache_web_instance"
  }
}