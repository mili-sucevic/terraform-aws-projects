# AWS Provider
provider "aws" {
  region  = var.region
  profile = var.profile_name
}

# AWS VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block_range
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Environment" = var.environment_tag
  }
}

# AWS Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Environment" = var.environment_tag
  }
}

# AWS Public Subnet
resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet1_cidr_block_range
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    "Environment" = var.environment_tag
    "Type"        = var.environment_type
  }
}

# AWS Public Route Table
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Environment" = var.environment_tag
  }
}

# AWS Route Table Association
resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rtb_public.id
}