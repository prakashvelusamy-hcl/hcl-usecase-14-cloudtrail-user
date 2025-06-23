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
}

module "cloud_watch" {
source = "./modules/terraform-aws-cloudwatch"
}