# Provider Block
provider "aws" {
<<<<<<< HEAD
  region = "us-east-1"
=======
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
>>>>>>> a081d7c00bc7eb299465359ee0b9f0d70f839a15
}

# Resource Block
resource "aws_instance" "first-ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = var.instancetype
  tags = {
    Name = "first-ec2"
  }
}

resource "aws_eip" "lb" {
  vpc = true
  tags = {
    Name = "first-elastic-ip"
  }
}

/*
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "mili-attributes-demo"
}
*/

output "aws_eip" {
  value = aws_eip.lb.public_ip
}

/*
output "my-s3-bucket" {
  value = aws_s3_bucket.s3-bucket.bucket_domain_name
}
*/
