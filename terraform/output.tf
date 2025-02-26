output "alb_url" {
  description = "The URL of the Application Load Balancer"
  value       = aws_lb.2048_alb.dns_name
}

output "application_url" {
  description = "The URL of the application"
  value       = "http://${aws_route53_record.2048.name}"
}

output "https_application_url" {
  description = "The URL of the application"
  value       = "https://${aws_route53_record.2048.name}"
}
