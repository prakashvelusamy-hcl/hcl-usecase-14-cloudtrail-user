resource "aws_s3_bucket" "log_bucket" {
  bucket = var.cloud_trail_bucket_name
  tags  = var.project_tag
}

resource "aws_s3_bucket_versioning" "log_bucket_versioning" {
  bucket = aws_s3_bucket.log_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

#resource "aws_s3_bucket_acl" "log_bucket_acl" {
#  bucket = aws_s3_bucket.log_bucket.bucket
#  acl    = "private" 
#}