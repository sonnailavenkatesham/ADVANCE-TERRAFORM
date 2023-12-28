resource "aws_vpc" "name" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = merge(
        var.common_tags, 
        {
            Name = "roboshop-VPC"
        }
    )
}

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.name.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = var.subnet_azs[count.index]

    tags = merge(
        var.common_tags, { Name = "${var.subnet_name[0]}-${var.subnet_azs[count.index]}"}
    )
}

resource "aws_subnet" "private" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.name.id
    cidr_block = var.private_subnet_cidr[count.index]
    availability_zone = var.subnet_azs[count.index]
    tags = merge(
        var.common_tags, { Name = "${var.subnet_name[1]}-${var.subnet_azs[count.index]}"}
    )
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = merge(
        var.common_tags, { Name = "roboshop-vpc-igw"}
    )
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.name.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
    tags = merge(
        var.common_tags, { Name = "public-route-table"}
    )
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.name.id

    tags = merge(
        var.common_tags, { Name = "private-route-table"}
    )
}

resource "aws_route_table_association" "public" {
    count = length(var.subnet_name)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
    count = length(var.subnet_name)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}