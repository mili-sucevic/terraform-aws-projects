resource "aws_internet_gateway" "igw" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet
  ]
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gateway"
  }
}