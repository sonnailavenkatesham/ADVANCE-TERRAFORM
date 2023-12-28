resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "Allow all traffic"

  dynamic "ingress" {
    for_each = var.ingress
    content {
        description      = ingress.value["description"]
        from_port        = ingress.value["from_port"]
        to_port          = ingress.value["to_port"]
        protocol         = "tcp"
        cidr_blocks      = ingress.value["cidr_blocks"]
    }
}


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr
  }

  tags = {
    Name = "Roboshop"
  }
}