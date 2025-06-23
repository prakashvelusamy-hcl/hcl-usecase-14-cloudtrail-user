resource "aws_cloudtrail" "main" {
  name                          = var.cloud_trail_name
  s3_bucket_name                = var.cloud_trail_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = false
  enable_log_file_validation    = true

  # Optional: You can enable logging for CloudWatch Logs
  cloud_watch_logs_group_arn    = "arn:aws:logs:us-west-2:123456789012:log-group:MyCloudWatchLogGroup"
  cloud_watch_logs_role_arn     = "aws_iam_role.cloudtrail_role.arn"

  # Optional: Enable logging for S3 events
  event_selector {
    read_write_type = "All"
    include_management_events = true
  }

  tags = var.project_tag
}