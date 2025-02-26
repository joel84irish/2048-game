output "alb_url" {
  description = "The URL of the Application Load Balancer"
  value       = aws_lb.tm_alb.dns_name
}

output "application_url" {
  description = "The URL of the application"
  value       = "http://${aws_route53_record.tm.name}"
}

output "https_application_url" {
  description = "The URL of the application"
  value       = "https://${aws_route53_record.tm.name}"
}
