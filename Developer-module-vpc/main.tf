resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  tags = merge(
    var.common_tags, { Name = "${var.project_name}-vpc"}
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.name.id
  tags = merge(
    var.common_tags, { Name = "${var.project_name}-igw"}
  )
}

resource "aws_subnet" "public" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.name.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = local.azs[count.index]

    tags = merge(
        var.common_tags, { Name = "${var.project_name}-${var.subnet_name[0]}-${local.azs[count.index]}"}
    )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)
  cidr_block = var.private_subnet_cidr[count.index]
  vpc_id = aws_vpc.name.id
  availability_zone = local.azs[count.index]

  tags = merge(
        var.common_tags, { Name = "${var.project_name}-${var.subnet_name[1]}-${local.azs[count.index]}"}
    )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    var.common_tags, { Name = "${var.project_name}-public-route-table"}
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.name.id

  tags = merge(
    var.common_tags, { Name = "${var.project_name}-private-route-table"}
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
