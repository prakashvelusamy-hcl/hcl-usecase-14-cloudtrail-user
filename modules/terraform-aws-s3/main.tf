resource "aws_s3_bucket" "log_bucket" {
  bucket = var.cloud_trail_bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "s3:PutObject"
        Resource  = "arn:aws:s3:::${var.cloud_trail_bucket_name}/*"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
      },
      {
        Effect    = "Allow"
        Action    = "s3:GetBucketAcl"
        Resource  = "arn:aws:s3:::${var.cloud_trail_bucket_name}"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
      }
    ]
  })
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