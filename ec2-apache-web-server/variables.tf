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

variable "dns-name" {
  type    = string
  default = "cmcloudlab580.info." # e.g "cmcloudlab1234.info."
}

variable "mili_keypair" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6jXnwz3p8qOCB32BKT+zKlcQ81VmnseY51e2AnTxH3PNuoJm5FDtMbuyLsdQzuSPUtE0zxJ+A7rKZOnmv40K1Sg1S7co7P+oYNwhneyHCFzeL1p9Tjsiqhss5KscPOoFd/JIlAc29Bpv2buL6kzIop/PFu6sguNf90t0MuO7bpWgRj8DnG/DzSmIADM/oV6tll9EmTzz3O4amDwE3P/lUpGPqBImlwsCicFK9W2XUzU3nDFpr5awepXRLsR75CGYaKoyPJGdYqaLH2YE0DkxCpN2MYTcKW8Q29Z2fD72DuoxQgduYLJOYpdNe7ODOSPq7cs8s8naY144q3k9kzNT5 cloud_user@0fab1f18cc3c.mylabserver.com"
}
