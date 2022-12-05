# AWS Region VAR
variable "region" {
  default = "us-east-1"
}

# AWS Profile VAR
variable "profile_name" {
  default = "default"
}

# AWS VPC VAR
variable "vpc_id" {
  description = "VPC ID"
  default     = ""
}

# AWS Enviornment Tag VAR
variable "environment_tag" {
  description = "Environment tag"
  default     = ""
}