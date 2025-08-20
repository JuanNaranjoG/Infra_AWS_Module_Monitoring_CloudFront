###############################
# Alarmas CloudFront
###############################

# Alarmas de errores 5xx
resource "aws_cloudwatch_metric_alarm" "cloudfront_5xx" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-5xxError-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cloudfront_5xx_error_evaluation_periods
  metric_name         = "5xxError"
  namespace           = "AWS/CloudFront"
  period              = var.cloudfront_5xx_error_events_period
  statistic           = "Average"
  threshold           = var.cloudfront_5xx_error_threshold
  alarm_description   = "Errores 5xx en el CloudFront"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "cloudfront_4xx" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-4xxError-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cloudfront_4xx_error_evaluation_periods
  metric_name         = "4xxError"
  namespace           = "AWS/CloudFront"
  period              = var.cloudfront_4xx_error_events_period
  statistic           = "Average"
  threshold           = var.cloudfront_4xx_error_threshold
  alarm_description   = "Errores 4xx en el CloudFront"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

# Alarmas de latencia de origen
resource "aws_cloudwatch_metric_alarm" "cloudfront_origin_latency" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-OriginLatency-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cloudfront_origin_lantency_evaluation_periods
  metric_name         = "OriginLatency"
  namespace           = "AWS/CloudFront"
  period              = var.cloudfront_origin_lantency_events_period
  statistic           = "Maximum"
  threshold           = var.cloudfront_origin_lantency_threshold
  alarm_description   = "Latencia del origen elevada en el CloudFront"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

# Alarmas de cantidad de solictudes
resource "aws_cloudwatch_metric_alarm" "cloudfront_request" {

  alarm_name          = "${var.project}-${var.bdo_name_service}-Request-${var.bdo_environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cloudfront_request_evaluation_periods
  metric_name         = "Request"
  namespace           = "AWS/CloudFront"
  period              = var.cloudfront_request_events_period
  statistic           = "Maximum"
  threshold           = var.cloudfront_request_threshold
  alarm_description   = "Cantidad de solicitudes"

  tags = merge({
    name = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"
    },
    var.resource_tags
  )

  dimensions = {
    DistributionId = var.cloudfront_distribution
    Region         = "Global"
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}
