#  Define the VPC resource, giving it a unique name and the desired CIDR block range.
resource "aws_vpc" "vpc" {

  # IP Range for the VPC
  cidr_block = var.cidr_block

  # Enabling automatic hostname assigning
  enable_dns_support = true

  tags = {
    Name = "vpc"
  }
}