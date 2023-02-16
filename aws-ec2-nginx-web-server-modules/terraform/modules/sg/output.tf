# OUTPUT

## SG - ALLOW SSH - Will be calling in EC2 module
output "allow_ssh" {
  value = aws_security_group.sg_22.id
}

## SG - ALLOW HTTP - Will be calling in EC2 module
output "allow_http" {
  value = aws_security_group.sg_80.id
}