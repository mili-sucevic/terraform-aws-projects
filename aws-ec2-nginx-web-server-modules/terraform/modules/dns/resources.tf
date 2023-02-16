# DNS MODULE

## AWS Provider
provider "aws" {
  region = var.region
}

## Route53 Zone
resource "aws_route53_zone" "domain" {
  name = var.domain_name

  tags = {
    name = "route-53-domain"
  }
}

## Route53 A Record
resource "aws_route53_record" "a_record_item" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = element(split(" ", var.aRecords[count.index]), 0)
  type    = "A"
  ttl     = var.ttl
  records = [element(split(" ", var.aRecords[count.index]), 1)]
  count   = length(var.aRecords)
}

# Route53 CNAME Records
resource "aws_route53_record" "cname_record_item" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = element(split(" ", var.cnameRecords[count.index]), 0)
  type    = "CNAME"
  ttl     = var.ttl
  records = [element(split(" ", var.cnameRecords[count.index]), 1)]
  count   = length(var.cnameRecords)
}