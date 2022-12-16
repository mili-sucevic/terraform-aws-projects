# INPUT VARS

## GENERAL
variable "region" {
  default = "us-east-1"
}

## ROUTE53
variable "domain_name" {
  description = "Domain name"
  default     = ""
}

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