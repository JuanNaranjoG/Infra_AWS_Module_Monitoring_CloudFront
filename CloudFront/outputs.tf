###############################
# Outputs
###############################

## Alarma por porcentaje de errores 5xx en CloudFront
output "cloudfront_5xx_error_rate" {
  value = [
    for key, _ in var.cloudfront_distributions :
    aws_cloudwatch_metric_alarm.cloudfront_5xx[key].alarm_name
  ]
}

## Alarma por latencia del origen en CloudFront
output "cloudfront_origin_latency" {
  value = [
    for key, _ in var.cloudfront_distributions :
    aws_cloudwatch_metric_alarm.cloudfront_origin_latency[key].alarm_name
  ]
}

## Alarma por errores en ejecución de funciones Lambda@Edge o Function
output "cloudfront_function_execution_errors" {
  value = [
    for key, _ in var.cloudfront_distributions :
    aws_cloudwatch_metric_alarm.cloudfront_function_execution_errors[key].alarm_name
  ]
}
