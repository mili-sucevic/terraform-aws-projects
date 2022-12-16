# INPUT VARS

## GENERAL
variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

## VPC
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

## PUBLIC SUBNETS
variable "public_subnet" {
  description = "The CIDR block for public subnet of VPC"
  default     = "10.0.1.0/24"
}
