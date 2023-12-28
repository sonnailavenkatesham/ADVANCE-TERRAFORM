resource "aws_instance" "name" {
    for_each = var.instance_names
    ami = var.ami_id
    instance_type = each.value
    security_groups = [aws_security_group.allow_all.name]
    tags = {
      Name = each.key
      Project = "Roboshop"
      Enveronment = "DEV"
      Terraform = true
    }
}

resource "aws_route53_record" "record" {
    for_each = aws_instance.name
    zone_id = var.route53_zone_id
    name    = "${each.key}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [ each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}