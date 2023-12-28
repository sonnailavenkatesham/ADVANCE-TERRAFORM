variable "ami_id" {
    default = "ami-03265a0778a880afb"
}

variable "sg_cidr" {
    default = ["0.0.0.0/0"]
}

variable "route53_zone_id" {
    default = "Z05444171VES3WQ8S22YW"
}

variable "domain_name" {
    type = string
    default = "venkateshamsonnalia143.online"
}

variable "instance_names" {
    type = map
    default = {
        mongodb = "t2.micro"
        catalogue = "t2.micro"
        user = "t2.micro"
        web = "t2.micro"
    }
}

variable "sg_name" {
    type = string
    default = "allow-all"
  
}

variable "ingress" {
    type = list
    default = [
        {
            description      = "Allow traffice from HTTPS"
            from_port        = 443
            to_port          = 443
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow traffice from SSH"
            from_port        = 22
            to_port          = 22
            cidr_blocks      = ["0.0.0.0/0"]
        },
        {
            description      = "Allow traffice from HTTP"
            from_port        = 80
            to_port          = 80      
            cidr_blocks      = ["0.0.0.0/0"]
        }
    ]
}