## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_trail"></a> [cloud\_trail](#module\_cloud\_trail) | ./modules/terraform-aws-cloudtrail | n/a |
| <a name="module_cloud_watch"></a> [cloud\_watch](#module\_cloud\_watch) | ./modules/terraform-aws-cloudwatch | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/terraform-aws-s3 | n/a |
| <a name="module_sns"></a> [sns](#module\_sns) | ./modules/terraform-aws-sns | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | Description for the CloudWatch alarm | `string` | `"Triggers on AWS Console login attempts"` | no |
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | Name of the CloudWatch alarm | `string` | `"ConsoleLoginAlarm"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The region we are creating the resources | `any` | n/a | yes |
| <a name="input_cloud_trail_bucket_name"></a> [cloud\_trail\_bucket\_name](#input\_cloud\_trail\_bucket\_name) | The cloud\_trail\_bucket\_name for storing the cloud Trail logs | `string` | n/a | yes |
| <a name="input_cloud_trail_name"></a> [cloud\_trail\_name](#input\_cloud\_trail\_name) | The Cloud Trail name | `string` | n/a | yes |
| <a name="input_comparison_operator"></a> [comparison\_operator](#input\_comparison\_operator) | Comparison operator for the threshold | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | Number of evaluation periods for the alarm | `number` | `1` | no |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | Name of the CloudWatch metric | `string` | `"ConsoleLoginEventCount"` | no |
| <a name="input_metric_namespace"></a> [metric\_namespace](#input\_metric\_namespace) | Namespace of the CloudWatch metric | `string` | `"CloudTrailMetrics"` | no |
| <a name="input_period"></a> [period](#input\_period) | Period (in seconds) to evaluate the metric | `number` | `300` | no |
| <a name="input_project_tag"></a> [project\_tag](#input\_project\_tag) | The project\_tag for this project | `map(string)` | n/a | yes |
| <a name="input_statistic"></a> [statistic](#input\_statistic) | Statistic to apply to the metric | `string` | `"Sum"` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | Threshold value for the alarm | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_watch_logs_group_arn"></a> [cloud\_watch\_logs\_group\_arn](#output\_cloud\_watch\_logs\_group\_arn) | n/a |
