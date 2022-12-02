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

variable "dns_name" {
  type    = string
  default = "cmcloudlab469.info." # e.g "cmcloudlab1234.info."
}

variable "mili_keypair" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDxtoWtE4NkhZm+IR46TDF32utEXP5P7OI1qUIH9z7JmJNRnbC2gJp1azFX8svimWdY/YcS0jevkxTZmeOqASLv/LVNh+0/CUazujvxsngg5od7QDJy0Vr+/ltHfVy+62adZm5pK8tYkkCmWY36St2YyNOQCyrcMsXr15Uz7aH9uBQtID3euFjxhIwecamXZmlyqSYW8CrFqAlUtCqiaXj8MbpdOJGsyxC5yKHsSFALFtcK7rCrmvgppAuWmKrJqsIIcVpf97q3M68CtEO7ku8LGAJauAAfOSQlOoBTaRyVDIhkeMWIyMi9XEXf7ZQfqvCl4kNiyQfILzKdzh2K3mhd cloud_user@0fab1f18cc3c.mylabserver.com"
}

variable "zone_id" {
  type    = string
  default = "Z06540751DFO4LHGMQENS"
}

variable "record_name" {
  type    = string
  default = "web-app.cmcloudlab469.info"
}
