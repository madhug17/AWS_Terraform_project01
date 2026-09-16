resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zone_1
  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-Private-Subnet-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zone_2
  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-Private-Subnet-2"
  }
}