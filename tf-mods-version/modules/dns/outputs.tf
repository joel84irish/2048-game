output "certificate_arn" {
  description = "The ARN of the created ACM certificate"
  value       = aws_acm_certificate.main.arn
}

output "domain_name" {
  description = "The full domain name of the created record"
  value       = aws_route53_record.main.name
}

output "hosted_zone_id" {
  description = "The ID of the Route53 hosted zone"
  value       = data.aws_route53_zone.main.zone_id
}

output "certificate_validation_completion" {
  value = aws_acm_certificate_validation.main.id
}
