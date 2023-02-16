# Launch a Webserver Instance hosting WordPress in it.
resource "aws_instance" "bastion" {
  depends_on = [
    aws_instance.wordpress,
    aws_instance.mysql
  ]

  # AMI ID - Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public-subnet.id

  key_name = var.keypair

  # Attaching 2 security groups here, 1 for the MySQL Database access by the Web-servers,
  # & other one for the Bastion Host access for applying updates & patches!  
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]

  tags = {
    Name = "bastion"
  }
}