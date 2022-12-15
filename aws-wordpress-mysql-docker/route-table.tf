# Define a route table for the public subnet, specifying the internet gateway as the target for all internet-bound traffic.
resource "aws_route_table" "public-subnet-rt" {
  depends_on = [
    aws_vpc.vpc,
    aws_internet_gateway.igw
  ]

  # VPC ID
  vpc_id = aws_vpc.vpc.id

  # NAT Rule
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-table-internet-gateway"
  }
}

# Associate the routing table to the Public Subnet to provide the Internet Gateway address.
resource "aws_route_table_association" "rt-association" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
    aws_subnet.private-subnet,
    aws_route_table.public-subnet-rt
  ]

  # Public Subnet ID
  subnet_id = aws_subnet.public-subnet.id

  #  Route Table ID
  route_table_id = aws_route_table.public-subnet-rt.id
}