module "dynamo_monitoring" {
  source          = "git::git@github.com:bocc-principal/Infra_AWS_Module_Monitoring_CloudFront.git//CloudFront?ref=feature"
  distribution   = var.cloudfront_distribution
  project         = var.project
  name_service    = var.name_service
  bdo-environment = var.bdo-environment
  purpose         = var.purpose

  sns_topic_arn = var.sns_topic_arn

}

########
#KMS
/*resource "aws_kms_key" "kms_sns" {
  description = "kms sns"
  enable_key_rotation = true

  policy = file("${path.module}/policies/kms-policy-sns.json")

}

#################
# Create sns
#################
resource "aws_sns_topic" "monitoring_sns" {
  name = "monitoring_topic_${var.project}"
  kms_master_key_id = aws_kms_key.kms_sns.arn
}

resource "aws_sns_topic_subscription" "monitoring_sns_subscription" {

  for_each  = toset(["chquinterop@bancodeoccidente.com.co",
  "GARENASG@bancodeoccidente.com.co"])
  topic_arn = aws_sns_topic.monitoring_sns.arn
  protocol  = "email"
  endpoint  = each.value
}
*/
