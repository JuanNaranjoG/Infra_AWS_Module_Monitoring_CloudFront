###############################
# Alarmas CloudFront
###############################

# Alarmas de errores 5xx
resource "aws_cloudwatch_metric_alarm" "cloudfront_5xx" {

  for_each            = var.cloudfront_distributions
  alarm_name          = "${var.project}-${var.bdo_name_service}-5xxErrorRate-${each.key}-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cf_5xx_evaluation_periods
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = var.cf_5xx_period
  statistic           = "Average"
  threshold           = var.cf_5xx_threshold
  alarm_description   = "Errores 5xx en el CloudFront"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${each.key}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = each.value
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

# Alarmas de latencia de origen
resource "aws_cloudwatch_metric_alarm" "cloudfront_origin_latency" {

  for_each            = var.cloudfront_distributions
  alarm_name          = "${var.project}-${var.bdo_name_service}-OriginLatency-${each.key}-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cf_origin_latency_evaluation_periods
  metric_name         = "OriginLatency"
  namespace           = "AWS/CloudFront"
  period              = var.cf_origin_latency_period
  statistic           = "Average"
  threshold           = var.cf_origin_latency_threshold
  alarm_description   = "Latencia del origen elevada en el CloudFront"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${each.key}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = each.value
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

# Alarmas de errores de ejecución de funciones
resource "aws_cloudwatch_metric_alarm" "cloudfront_function_errors" {

  for_each            = var.cloudfront_distributions
  alarm_name          = "${var.project}-${var.bdo_name_service}-FunctionExecutionErrors-${each.key}-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cf_function_errors_evaluation_periods
  metric_name         = "FunctionExecutionErrors"
  namespace           = "AWS/CloudFront"
  period              = var.cf_function_errors_period
  statistic           = "Sum"
  threshold           = var.cf_function_errors_threshold
  alarm_description   = "Errores de ejecución de funciones en CloudFront"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${each.key}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = each.value
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}
