# Define the public and private subnets, specifying the VPC ID, CIDR block range, and availability zone.
resource "aws_subnet" "public-subnet" {
  depends_on = [
    aws_vpc.vpc
  ]

  # VPC in which subnet has to be created
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_range

  # AZ of this subnet
  availability_zone = var.az_public

  # Enabling automatic public IP assignment on instance launch
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}