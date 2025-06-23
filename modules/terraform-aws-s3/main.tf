resource "aws_s3_bucket" "log_bucket" {
  bucket = var.cloud_trail_bucket_name
  acl    = "private"
  tags  = var.project_tag
}

resource "aws_s3_bucket_versioning" "log_bucket_versioning" {
  bucket = aws_s3_bucket.log_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}