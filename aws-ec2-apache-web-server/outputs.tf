output "web_instance_ip" {
  value = aws_instance.web.public_ip
}

output "web_instance_url" {
  value = join(".", ["mili-web", data.aws_route53_zone.dns.name])
}
