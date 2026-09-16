variable "AWSProject02Goundlamadhug" {
  description = "Project name"
  type        = string
  default     = "AWSProject02Terraform"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.10.2.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.10.3.0/24"
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
  default     = "eu-north-1a"
}

variable "availability_zone_2" {
  description = "Second availability zone"
  type        = string
  default     = "eu-north-1b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}