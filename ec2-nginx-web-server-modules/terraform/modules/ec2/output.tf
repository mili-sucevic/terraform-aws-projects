# OUTPUT

## EC2 EIP - Will be calling in Root Resources DNS Module 
output "instance_eip" {
	value = aws_eip.ec2_eip.public_ip
}

## EC2 Keypair - Will be calling in Root Resources EC2 Module
output "ec2_key_name" {
  value = aws_key_pair.ec2_key.key_name
}