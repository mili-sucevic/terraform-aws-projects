# OUTPUT

## VPC - calling in SG and EC2 Modules
output "vpc_id" {
  value = aws_vpc.vpc.id
}

## PUBLIC SUBNETS - calling in EC2 module
output "public_subnet" {
  value = [aws_subnet.public_subnet.id]
}