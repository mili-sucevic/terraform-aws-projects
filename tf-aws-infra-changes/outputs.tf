output "instance_name" {
  description = "The tag name for this instance"
  value       = var.instance_name
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS address of the EC2 instance"
  value       = aws_instance.app_server.public_dns
}

output "instance_state" {
  value       = aws_instance.app_server.instance_state
}

output "instance_arn" {
  value       = aws_instance.app_server.arn
}
