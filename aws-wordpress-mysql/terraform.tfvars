# General
region  = "us-east-1"
profile = "default"
keypair = "tf-deploy"

# VPC
cidr_block = "10.0.0.0/16"

# Subnets
public_subnet_range  = "10.0.1.0/24"
az_public            = "us-east-1a"
private_subnet_range = "10.0.2.0/24"
az_private           = "us-east-1b"

# EC2 WordPress
ami           = "ami-0b0dcb5067f052a63"
instance_type = "t2.micro"

