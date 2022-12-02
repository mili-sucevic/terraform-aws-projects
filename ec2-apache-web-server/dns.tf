#DNS Configuration

resource "aws_route53_record" "www" {
  zone_id = "Z017150934LTD1INZ3VHU"
  name    = "web-app.cmcloudlab580.info"
  type    = "A"
  ttl     = 300
  records = [aws_eip.eip_manager.public_ip]
}
