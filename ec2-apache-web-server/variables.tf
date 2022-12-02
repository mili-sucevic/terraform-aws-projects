variable "region" {
  default = "us-west-2"
}

variable "profile_name" {
  default = "default"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "cidr_public_subnet" {
  default = "10.0.1.0/24"
}

variable "aws_ami" {
  default = "ami-094125af156557ca2"
}

variable "instance_type" {
  default = "t2.micro"
}

