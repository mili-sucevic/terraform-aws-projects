# Define a route table for the public subnet, specifying the internet gateway as the target for all internet-bound traffic.
resource "aws_route_table" "nat-gateway-rt" {
  depends_on = [
    aws_nat_gateway.nat-gateway
  ]

  # VPC ID
  vpc_id = aws_vpc.vpc.id

  # NAT Rule
  route {
    cidr_block = "0.0.0.0/0"

    # Identifier of a VPC NAT gateway
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "route-table-nat-gateway"
  }
}

# Creating an Route Table Association of the NAT Gateway route table with the Private Subnet!
resource "aws_route_table_association" "rt-association-ng" {
  depends_on = [
    aws_route_table.nat-gateway-rt
  ]

  # Public Subnet ID
  subnet_id = aws_subnet.private-subnet.id

  #  Route Table ID
  route_table_id = aws_route_table.nat-gateway-rt.id
}