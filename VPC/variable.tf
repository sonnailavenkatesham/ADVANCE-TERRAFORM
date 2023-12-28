variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}

variable "ami_id" {
    default = "ami-03265a0778a880afb"
  
}
variable "subnet" {
    default = ["public", "private"]
  
}

variable "subnet_cidr" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "route_table" {
    default = []
  
}
variable "subnet_type" {
  default = ["public", "private"]
}