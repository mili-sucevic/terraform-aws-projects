variable "region" {
  default = "us-east-1"
}

variable "profile_name" {
  default = "default"
}

variable "cidr_block_range" {
  default = "10.1.0.0/16"
}

variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default = "10.1.0.0/24"
}

variable "subnet2_cidr_block_range" {
  description = "The CIDR block for private subnet of VPC"
  default = "10.2.0.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "environment_tag" {
  default = ""
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}

variable "environment_type" {
  default = "Public"
}