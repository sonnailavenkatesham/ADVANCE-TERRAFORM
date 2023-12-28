output "vpc_id" {
 value =  aws_vpc.name.id
}

output "azs" {
  value = local.azs
}