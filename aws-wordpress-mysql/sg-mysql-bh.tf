# Creating a Security Group for the MySQL Instance which allows only bastion host to connect & do the updates.
resource "aws_security_group" "mysql-bastion-ssh-sg" {
  depends_on = [
    aws_vpc.vpc,
    aws_subnet.public-subnet,
    aws_subnet.private-subnet,
    aws_security_group.bastion-sg
  ]

  # Name of the security group for MySQL allowing Bastion Host to SSH and do updates
  name        = "mysql-bastion-ssh-sg"
  description = "MySQL allows Bastion host access for updates"

  # VPC ID in which Security group has to be created
  vpc_id = aws_vpc.vpc.id

  # Create an inbound rule for MySQL Bastion Host
  ingress {
    description     = "Bastion Host SG"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion-sg.id]
  }

  # Outward Network Traffic from the MySQL instance
  egress {
    description = "Outbound from MySQL Bastion Host"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySQL with Bastion Host Security Group"
  }
}