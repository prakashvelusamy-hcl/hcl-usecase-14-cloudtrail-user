variable "cloud_trail_bucket_name" {
description = "The cloud_trail_bucket_name for storing the cloud Trail logs"
type = string 
}
variable "project_tag" {
description = "The project_tag for this project"
type = map(string)
}
variable "cloud_trail_name" {
description = "The Cloud Trail name" 
type = string
}