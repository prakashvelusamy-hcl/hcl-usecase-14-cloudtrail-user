module "s3" {
source = "./modules/terraform-aws-s3"
cloud_trail_bucket_name = var.cloud_trail_bucket_name
project_tag = var.project_tag
}
module "cloud_trail" {
source = "./modules/terraform-aws-cloudtrail"
cloud_trail_bucket_name =var.cloud_trail_bucket_name
cloud_trail_name = var.cloud_trail_name
project_tag = var.project_tag
cloud_watch_logs_group_arn = module.cloud_watch.cloud_watch_logs_group_arn
 depends_on = [module.cloud_watch]
 aws_region = var.aws_region
}

module "cloud_watch" {
source = "./modules/terraform-aws-cloudwatch"
sns_topic_arn = module.sns.sns_topic_arn
project_tag = var.project_tag
  metric_name    = var.metric_name
  metric_namespace = var.metric_namespace
  alarm_name     = var.alarm_name
  alarm_description = var.alarm_description
  statistic      = var.statistic
  period         = var.period
  evaluation_periods = var.evaluation_periods
  threshold      = var.threshold
  comparison_operator = var.comparison_operator
}
module "sns" {
source = "./modules/terraform-aws-sns"
project_tag = var.project_tag
}