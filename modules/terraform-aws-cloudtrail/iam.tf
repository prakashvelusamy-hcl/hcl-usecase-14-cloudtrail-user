resource "aws_iam_role" "cloudtrail_role" {
  name = "CloudTrailRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
      }
    ]
  })

  tags = var.project_tag
}

resource "aws_iam_policy" "cloudtrail_policy" {
  name        = "CloudTrailLoggingPolicy"
  description = "Policy for CloudTrail to log to S3 and CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.cloud_trail_bucket_name}/*", 
          "arn:aws:s3:::${var.cloud_trail_bucket_name}"
        ]
      },
      {
        Effect   = "Allow"
        Action   = [
          "logs:PutLogEvents",
          "logs:CreateLogStream"
        ]
        Resource = [
          "arn:aws:logs:${var.aws_region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/cloudtrail/${var.cloud_trail_name}-log-group:*"
        ]
      },
      {
        Effect   = "Allow"
        Action   = "cloudtrail:StartLogging"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cloudtrail_policy_attachment" {
  policy_arn = aws_iam_policy.cloudtrail_policy.arn
  role       = aws_iam_role.cloudtrail_role.name
}