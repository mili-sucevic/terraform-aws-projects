resource "aws_instance" "web" {
depends_on = [
  aws_vpc.vpc,
  aws_subnet.public_subnet,
  aws_internet_gateway.igw,
  aws_route_table.public_subnet_rt,
  aws_route_table_association.public_subnet_rta
]

  ami             = var.ami
  instance_type   = var.instance-type
  key_name        = var.keypair
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.sg-web.id]

  tags = {
    Name = "web-apache"
  }
}