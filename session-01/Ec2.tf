resource "aws_instance" "name" {
    count = length(var.instance_names)
    ami= var.ami_id
    instance_type = "t2.micro"
    security_groups = [aws_security_group.allow_all.name]
    tags = {
        Name = var.instance_names[count.index]
    }
  
}

resource "aws_route53_record" "record" {
  count = length(var.instance_names)
  zone_id = var.route53_zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.name[count.index].private_ip]
}