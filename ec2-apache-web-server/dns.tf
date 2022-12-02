#DNS Configuration

resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"
  ttl     = 300
  records = [aws_eip.eip_manager.public_ip]
}
