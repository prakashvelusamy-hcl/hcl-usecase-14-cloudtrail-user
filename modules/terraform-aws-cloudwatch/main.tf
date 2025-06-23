resource "aws_cloudwatch_log_group" "cloudtrail_log_group" {
  name              = "/aws/cloudtrail/Prakash-cloudtrail"
  retention_in_days = 30  # Optional: Set the retention period for logs
}
