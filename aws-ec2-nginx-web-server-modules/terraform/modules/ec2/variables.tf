# INPUT VARS

## GENERAL - predefined vars
variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

## EC2 - defining vars first time
variable "ami" {
  default = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_pair_name" {
  default = ""
}

## Network - Will be calling from Root Resources EC2 Module
variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  description = "EC2 Public Subnet"
  default     = ""
}

## SG - Will be calling from Root Resources EC2 Module
variable "vpc_security_group_ids" {
  description = "EC2 ssh and http security groups"
  type        = list(any)
  default     = []
}