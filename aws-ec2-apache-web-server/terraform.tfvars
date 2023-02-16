## General Vars
region    = "us-east-1"
profile   = "default"
keypair   = "tf-deploy"
base-path = "/home/cloud_user/github/terraform-aws-projects/ec2-apache-web-server-demo/"

## VPC Vars
cidr-block = "10.0.0.0/16"

## Subnet Vars
public-subnet-range = "10.0.1.0/24"
az-public           = "us-east-1a"

## EC2 Vars
ami           = "ami-0b0dcb5067f052a63"
instance-type = "t3.micro"

## DNS Vars
dns-name = "cmcloudlab453.info."