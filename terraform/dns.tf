data "aws_route53_zone" "lab" {
  name = "lab.joelirish-game-project.app"
}

resource "aws_route53_record" "2048" {
  zone_id = data.aws_route53_zone.lab.zone_id
  name    = "tm.${data.aws_route53_zone.lab.name}"
  type    = "A"

  alias {
    name                   = aws_lb.tm_alb.dns_name
    zone_id                = aws_lb.tm_alb.zone_id
    evaluate_target_health = true
  }
}

## HTTPS/DNS
resource "aws_acm_certificate" "tm_cert" {
  domain_name       = "tm.lab.2048.joelirish.app
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "2048_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.tm_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.lab.zone_id
}

resource "aws_acm_certificate_validation" "tm_cert" {
  certificate_arn         = aws_acm_certificate.tm_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.2048_cert_validation : record.fqdn]
}
