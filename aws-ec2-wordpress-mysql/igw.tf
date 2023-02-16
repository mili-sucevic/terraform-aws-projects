# Create an internet gateway and attach it to the VPC.
resource "aws_internet_gateway" "igw" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
    aws_subnet.private-subnet
  ]

  # VPC in which IGW has to be created
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}