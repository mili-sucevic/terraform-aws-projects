# Provider Block
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

/*
# Resource Block
resource "aws_instance" "first-ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  tags = {
    Name = "first-ec2"
  }
}
*/

resource "aws_eip" "lb" {
  vpc = true
  tags = {
    Name = "first-elastic-ip"
  }
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "mili-attributes-demo"
}


output "aws_eip" {
  value = aws_eip.lb.public_ip
}

output "my-s3-bucket" {
  value = aws_s3_bucket.s3-bucket.bucket_domain_name
}
