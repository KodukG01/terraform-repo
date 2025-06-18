resource "aws_route53_record" "www" {
  count = 4
  zone_id = var.zone_id
  name    = "{var.instance[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.main[count.index].private_ip]
  allow_overwrite = true
}