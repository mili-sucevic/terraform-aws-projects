# AWS Network Module
module "network_module" {
  source          = "./modules/network"
  region          = var.region
  environment_tag = var.environment_tag
}

# AWS Security Group Module
module "sg_module" {
  source          = "./modules/sg"
  region          = var.region
  vpc_id          = module.network_module.vpc_id
  environment_tag = var.environment_tag
}

# AWS Instance Module
module "instance_module" {
  source              = "./modules/instance"
  region              = var.region
  vpc_id              = module.network_module.vpc_id
  subnet_public_id    = module.network_module.public_subnets[0]
  key_pair_name       = module.instance_module.ec2keyName
  security_group_ids  = [module.sg_module.allow_ssh, module.sg_module.allow_http]
  environment_tag     = var.environment_tag
}

# AWS DNS Module
module "dns_module" {
  source      = "./modules/dns"
  region      = var.region
  domain_name = "milisucevic.com"
  aRecords = [
    "milisucevic.com ${module.instance_module.instance_eip}",
  ]
  cnameRecords = [
    "www.milisucevic.com milisucevic.com"
  ]
}