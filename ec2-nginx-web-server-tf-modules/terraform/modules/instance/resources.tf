# AWS Provider
resource "aws_instance" "web" {
  ami                   	= var.instance_ami
  instance_type         	= var.instance_type
	subnet_id							  = var.subnet_public_id 
  vpc_security_group_ids 	= var.security_group_ids
  key_name               	= var.key_pair_name

	tags = {
		Environment = var.environment_tag
	}
}

# AWS Instance EIP
resource "aws_eip" "mili_instance_eip" {
  vpc      = true
  instance = aws_instance.web.id
}

resource "aws_key_pair" "ec2key" {
  key_name = "publicKey"
  public_key = file("~/.ssh/id_rsa.pub")
}