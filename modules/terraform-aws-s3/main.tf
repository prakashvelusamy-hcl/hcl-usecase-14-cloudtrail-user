resource "aws_s3_bucket" "log_bucket" {
  bucket = var.cloud_trail_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}