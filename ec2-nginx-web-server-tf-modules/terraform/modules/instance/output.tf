output "instance_eip" {
	value = aws_eip.mili_instance_eip.public_ip
}

output "ec2keyName" {
  value = aws_key_pair.ec2key.key_name
}