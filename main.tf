modules "s3" {
source = "./modules/terraform-aws-s3"
s3_bucket_name = var.s3_bucket_name
project_tag = var.project_tag
}
modules "cloud_trail" {
source = "./modules/terraform-aws-cloud_trail"
s3_bucket_name =var.s3_bucket_name
project_tag = var.project_tag
}