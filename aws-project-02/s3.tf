resource "aws_s3_bucket" "project02" {
  bucket = lower("${var.AWSProject02Goundlamadhug}-project02-bucket")

  tags = {
    Name = "${var.AWSProject02Goundlamadhug}-Project02-Bucket"
  }
}