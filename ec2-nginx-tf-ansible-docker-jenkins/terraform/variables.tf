variable "region" {
  description = "default free tier region"
  default     = "us-east-1"
}

variable "profile" {
  description = "default AWS profile cred"
  default     = "default"
}

variable "ami" {
  description = "default AWS AMI for us-east-1"
  default     = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  description = "default AWS free tier instance type in us-east-1"
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "EC2 ssh security group"
  type 				= list
  default 		= []
}

variable "name" {
  description = "name of the instance"
  default     = "nginx-webserver"
}

variable "group" {
  description = "name of the ansible dynamic inventory group."
  default     = "webservers"
}