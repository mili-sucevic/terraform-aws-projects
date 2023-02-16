# AWS Subnet
resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.vpc
  ]

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public-subnet-range
  map_public_ip_on_launch = true
  availability_zone       = var.az-public

  tags = {
    Name = "public_subnet"
  }
}