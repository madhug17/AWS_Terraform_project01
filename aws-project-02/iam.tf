# 1. IAM Role for EC2
resource "aws_iam_role" "ec2_s3_role" {
  name = "${var.AWSProject02Goundlamadhug}-EC2-S3-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-EC2-S3-Role"
  }
}

# 2. S3 Permissions Policy
resource "aws_iam_policy" "s3_access" {
  name        = "${var.AWSProject02Goundlamadhug}-S3-Access"
  description = "Allow EC2 to list, read, and upload objects to the Project 02 S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "ListBucket"
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = aws_s3_bucket.project02.arn
      },
      {
        Sid    = "ReadWriteObjects"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.project02.arn}/*"
      }
    ]
  })

  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-S3-Access"
  }
}

# 3. Attach Policy to Role
resource "aws_iam_role_policy_attachment" "ec2_s3_attach" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_access.arn
}

# 4. Instance Profile (Needed to attach the role to an EC2 instance)
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.AWSProject02Goundlamadhug}-EC2-Profile"
  role = aws_iam_role.ec2_s3_role.name
}
resource "aws_iam_role_policy_attachment" "ec2_s3" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_access.arn
}
