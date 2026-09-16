resource "aws_security_group" "ec2" {
  name        = "${var.AWSProject02Goundlamadhug}-EC2-SG"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-EC2-SG"
  }
}


# RDS Security Group
resource "aws_security_group" "rbs" {
  name        = "${var.AWSProject02Goundlamadhug}-RDS-SG"
  description = "Allow MySQL traffic from EC2 only"
  vpc_id      = aws_vpc.main.id
  ingress {
    description     = "Allow MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id] # Only resources using our EC2 Security Group can connect to RDS on port 3306.
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-RDS-SG"
  }
}
