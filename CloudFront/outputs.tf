###############################
# Outputs
###############################

## Alarma por porcentaje de errores 5xx en CloudFront
output "cloudfront_5xx_alarm_name" {
  description = "Nombre de la alarma de errores 5xx"
  value       = aws_cloudwatch_metric_alarm.cloudfront_5xx.alarm_name
}

## Alarma por latencia del origen en CloudFront
output "cloudfront_origin_latency" {
  description = "Nombre de la alarma de latencia del origen de CloudFront"
  value       = aws_cloudwatch_metric_alarm.cloudfront_origin_latency.alarm_name
}


## Alarma por errores en ejecución de funciones Lambda@Edge o Function
output "cloudfront_function_execution_errors" {
  description = "Nombre de la alarma de errores de ejecución de funciones de CloudFront"
  value       = aws_cloudwatch_metric_alarm.cloudfront_function_errors
}
