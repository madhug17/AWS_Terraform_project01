terraform {
  required_providers {
    # I need the AWS provider.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Mumbai region (Note: Hyderabad is ap-south-2)
}

# Create our resources.
resource "aws_instance" "web_server" {
  # web_server means your local name given to this resource block

  count = 2 # no of instances (EC2)
  ami   = data.aws_ami.amazon_linux.id
  # AMI = Amazon Machine Image (it varies by region)
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.web_security_group.id
  ]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from AWS Project 01!</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name    = "AWS-Project-01-WebServer-${count.index + 1}" # Adds a number to each instance
    Project = "AWS-Project-01"
    Owner   = "Madhu"
  }
}

resource "aws_security_group" "web_security_group" {
  name        = "web-server-sg"
  description = "Allow HTTP traffic"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AWS-Project-01-Web-SG"
  }
}

# Dynamic lookup for the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # 🛠️ Fixed: Changed "Owner" to lowercase "owners"

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
output "web_server_public_ips" {
  value = aws_instance.web_server[*].public_ip
}