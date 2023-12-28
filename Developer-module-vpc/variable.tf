variable "vpc_cidr_block" {
  
}
variable "enable_dns_hostnames" {
    default = true
}

variable "enable_dns_support" {
    default = true
}

variable "project_name" {
    default = "roboshop"
}

variable "common_tags" {
    default = {
        Name = "roboshop"
        Environment = "DEV"
        Terraform = true
    }
}

variable "subnet_name" {
  
}

variable "public_subnet_cidr" {
    type        = list
    description = "User must create two subnets"

    validation {
        # regex(...) fails if it cannot find a match
        condition     = length(var.public_subnet_cidr)==2
        error_message = "Please create 2 subnets."
    }
}
variable "private_subnet_cidr" {
    type        = list
    description = "User must create two subnets"

    validation {
        # regex(...) fails if it cannot find a match
        condition     = length(var.private_subnet_cidr)==2
        error_message = "Please create 2 subnets."
    }
}