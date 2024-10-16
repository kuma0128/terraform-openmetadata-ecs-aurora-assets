resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.cidr_subnets_public[0]
  availability_zone = var.az_a_name

  tags = {
    Name = "${var.name_prefix}-subnet-${var.region_short_name}-public-a"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.cidr_subnets_public[1]
  availability_zone = var.az_c_name

  tags = {
    Name = "${var.name_prefix}-subnet-${var.region_short_name}-public-c"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.cidr_subnets_private[0]
  availability_zone = var.az_a_name

  tags = {
    Name = "${var.name_prefix}-subnet-${var.region_short_name}-private-a"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.cidr_subnets_private[1]
  availability_zone = var.az_c_name

  tags = {
    Name = "${var.name_prefix}-subnet-${var.region_short_name}-private-c"
  }
}