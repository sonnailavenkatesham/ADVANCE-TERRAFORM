output "private_ip" {
    value = aws_instance.name[*].private_ip
  
}