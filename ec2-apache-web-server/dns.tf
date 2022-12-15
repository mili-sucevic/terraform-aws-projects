# DNS Configuration
data "aws_route53_zone" "dns" {
depends_on = [
  aws_vpc.vpc,
  aws_subnet.public_subnet,
  aws_internet_gateway.igw,
  aws_route_table.public_subnet_rt,
  aws_route_table_association.public_subnet_rta,
  aws_instance.web,
  null_resource.web-provisioners
]
  name         = var.dns-name
}

resource "aws_route53_record" "www" {
  zone_id  = data.aws_route53_zone.dns.zone_id
  name     = join(".", ["mili-web", data.aws_route53_zone.dns.name])
  type    = "A"
  ttl     = 300
  records = [aws_eip.eip-manager.public_ip]
}