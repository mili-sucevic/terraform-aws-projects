# INPUT VARS
## General Vars
variable "region" {}

variable "profile" {}

variable "keypair" {}

# base_path for refrencing 
variable "base-path" {}

## VPC Vars
variable "cidr-block" {}

## Subnet Vars
variable "public-subnet-range" {}
variable "az-public" {}

## EC2 Web Vars
variable "ami" {}
variable "instance-type" {}

## DNS Vars
variable "dns-name" {}