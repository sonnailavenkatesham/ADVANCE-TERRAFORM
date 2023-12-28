resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  tags = {
    Name = "web"
  }
}