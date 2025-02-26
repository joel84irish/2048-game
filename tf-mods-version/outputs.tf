output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = module.ecs.cluster_arn
}

output "ecs_service_name" {
  description = "The name of the ECS service"
  value       = module.ecs.service_name
}

output "application_url" {
  description = "The URL of the application"
  value       = "https://${module.dns.domain_name}"
}
