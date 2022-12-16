variable "region" {
  default = "us-east-1"
}

variable "profile_name" {
	default = "default"
}

variable "instance_ami" {
  description = "EC2 AMI Instance"
  default     = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "subnet_public_id" {
	description = "EC2 Subnet Public"
	default 		= ""
}

variable "security_group_ids" {
  description = "EC2 ssh security group"
  type 				= list
  default 		= []
}

variable "key_pair_name" {
  description = "EC2 Key pair name"
  default 		= ""
}

variable "environment_tag" {
  description = "Environment tag"
  default     = ""
}

variable "vpc_id" {
  description = "VPC id"
  default = ""
}

# variable "public_key_path" {
#   description = "Public key path"
#   default = file("~/.ssh/id_rsa.pub")
# }