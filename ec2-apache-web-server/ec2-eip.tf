# AWS EIP Association
resource "aws_eip_association" "eip-assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.eip-manager.id
}

resource "aws_eip" "eip-manager" {
  vpc = true
}