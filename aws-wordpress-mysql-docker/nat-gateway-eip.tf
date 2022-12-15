# Creating a NAT Gateway for MySQL instance to access the Internet (performing source NAT).
resource "aws_nat_gateway" "nat-gateway" {
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [
    aws_eip.nat-gateway-eip
  ]

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.nat-gateway-eip.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "NAT Gateway Project"
  }
}

# Creating an Elastic IP for the NAT Gateway
resource "aws_eip" "nat-gateway-eip" {
  depends_on = [
    aws_route_table_association.rt-association
  ]

  vpc = true
}
