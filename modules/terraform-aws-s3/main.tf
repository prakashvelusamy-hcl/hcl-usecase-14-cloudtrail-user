resource "aws_s3_bucket" "log_bucket" {
  bucket = var.cloud_trail_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }
  tags  = var.project_tag
}