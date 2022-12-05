output "allow_ssh" {
  value = aws_security_group.allow_ssh.id
}

output "allow_http" {
  value = aws_security_group.allow_http.id
}
