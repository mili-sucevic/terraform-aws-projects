# MODULES

## Network Module
module "network-module" {
  source = "./modules/network"
  region = var.region
}

## Security Group Module
module "sg-module" {
  source = "./modules/sg"
  region = var.region
  vpc_id = module.network-module.vpc_id
}

## Instance Module
module "ec2-module" {
  source = "./modules/ec2"
  region = var.region
  vpc_id = module.network-module.vpc_id

  key_pair_name          = module.ec2-module.ec2_key_name
  subnet_id              = module.network-module.public_subnet[0]
  vpc_security_group_ids = [module.sg-module.allow_ssh, module.sg-module.allow_http]
}

## DNS Group Module
module "dns-module" {
  source      = "./modules/dns"
  region      = var.region
  domain_name = "milisucevic.com"
  aRecords = [
    "milisucevic.com ${module.ec2-module.instance_eip}",
  ]
  cnameRecords = [
    "www.milisucevic.com milisucevic.com"
  ]
}
