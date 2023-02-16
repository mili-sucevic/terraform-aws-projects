resource "aws_vpc" "vpc" {
  cidr_block = var.cidr-block

  # Enabling automatic hostname assigning
  enable_dns_support = true

  tags = {
    Name = "mili-test-vpc"
  }
}