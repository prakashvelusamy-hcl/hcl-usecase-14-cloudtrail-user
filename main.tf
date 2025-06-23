module "s3" {
source = "./modules/terraform-aws-s3"
s3_bucket_name = var.s3_bucket_name
project_tag = var.project_tag
}
module "cloud_trail" {
source = "./modules/terraform-aws-cloudtrail"
s3_bucket_name =var.s3_bucket_name
project_tag = var.project_tag
}