output "web_instance_ip" {
  value = aws_instance.web.public_ip
}

output "web_instance_url" {
  value = "web-app.cmcloudlab469.info"
}
