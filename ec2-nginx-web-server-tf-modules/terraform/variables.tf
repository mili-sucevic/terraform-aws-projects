variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "profile_name" {
  default = "default"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "dev"
}