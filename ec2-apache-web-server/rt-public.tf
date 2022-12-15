resource "aws_route_table" "public_subnet_rt" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet,
    aws_internet_gateway.igw
  ]
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-table-internet-gateway"
  }
}

resource "aws_route_table_association" "public_subnet_rta" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public_subnet,
    aws_internet_gateway.igw,
    aws_route_table.public_subnet_rt
  ]
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet_rt.id
}