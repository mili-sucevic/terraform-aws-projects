# NETWORK MODULE

## AWS Provider
provider "aws" {
  region  = var.region
  profile = var.profile
}

## VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "mili-vpc"
  }
}

## PUBLIC SUBNET
resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet

  tags = {
    Name = "public-subnet"
  }
}

## INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet
  ]

  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

## ROUTE TABLE
resource "aws_route_table" "public_rt" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet,
    aws_internet_gateway.igw
  ]

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

## ROUTE TABLE ASSOCCIATION
resource "aws_route_table_association" "public_rta" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet,
    aws_internet_gateway.igw,
    aws_route_table.public_rt
  ]

  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}