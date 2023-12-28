resource "aws_security_group" "allow_all" {
  name        = "allow_tls"
  description = "Allow inbound traffic from HTTP-SSH"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Traffic from HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
  }
  ingress {
    description      = "Traffic from SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
  }

  tags = {
    Name = "roboshop-sg-vpc"
  }
}