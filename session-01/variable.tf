variable "ami_id" {
    default = "ami-03265a0778a880afb"
}

variable "sg_cidr" {
    default = ["0.0.0.0/0"]
}

variable "tags" {
    type= map
    default = {
        Project = "Roboshop"
        Terraform = true
        Enveronment = "DEV"
    }
  
}

variable "route53_zone_id" {
    default = "Z05444171VES3WQ8S22YW"
  
}

variable "domain_name" {
    type = string
    default = "venkateshamsonnalia143.online"
  
}

variable "instance_names" {
    type = list
    default = ["mongodb", "catalogue", "user", "web"]
}