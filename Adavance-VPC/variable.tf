variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "common_tags" {
    default = {
        Project = "Roboshop"
        Enveronment = "DEV"
        Terraform = true
    }
}

variable "subnet_name" {
    default = ["public", "private"]
}

variable "private_subnet_cidr" {
    default = ["10.0.10.0/24", "10.0.11.0/24"]
}