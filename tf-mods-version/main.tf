module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
}

module "alb" {
  source                = "./modules/alb"
  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.networking.alb_sg_id

  certificate_arn                   = module.dns.certificate_arn
  certificate_validation_completion = module.dns.certificate_validation_completion
}

module "ecs" {
  source           = "./modules/ecs"
  subnet_ids       = module.networking.public_subnet_ids
  ecs_tasks_sg_id  = module.networking.ecs_tasks_sg_id
  target_group_arn = module.alb.target_group_arn
  ecr_repo_url     = var.ecr_repo_url
  container_port   = var.container_port
  desired_count    = var.desired_count
  aws_region       = var.aws_region

  depends_on = [module.alb.https_listener_arn]
}

module "dns" {
  source       = "./modules/dns"
  domain_name  = var.domain_name
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}

