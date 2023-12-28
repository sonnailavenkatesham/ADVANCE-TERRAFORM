module "vpc" {
  source = "../Developer-module-vpc"
  vpc_cidr_block =var.vpc_cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  subnet_name = var.subnet_name
  private_subnet_cidr = var.private_subnet_cidr
}