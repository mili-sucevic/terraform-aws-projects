# AWS Region VAR
variable "region" {
  default = "us-east-1"
}

# AWS Profile VAR
variable "profile_name" {
  default = "default"
}

# AWS Route53 Domain Name VAR
variable "domain_name" {
  description = "Domain name"
  default     = ""
}

# AWS Enviornment Tag VAR
variable "environment_tag" {
  description = "Environment tag"
  default     = ""
}

# AWS A and CNAME Records
variable "aRecords" {
  type    = list(any)
  default = []
}

variable "ttl" {
  description = "time to live"
  default     = 300
}

variable "cnameRecords" {
  type    = list(any)
  default = []
}