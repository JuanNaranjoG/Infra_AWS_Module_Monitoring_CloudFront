###############################
# Outputs
###############################

## Alarma por porcentaje de errores 5xx en CloudFront
output "cloudfront_5xx_alarm_name" {
  description = "Nombre de la alarma de errores 5xx"
  value       = aws_cloudwatch_metric_alarm.cloudfront_5xx.alarm_name
}

output "cloudfront_4xx_alarm_name" {
  description = "Nombre de la alarma de errores 5xx"
  value       = aws_cloudwatch_metric_alarm.cloudfront_4xx.alarm_name
}


## Alarma por latencia del origen en CloudFront
output "cloudfront_origin_latency" {
  description = "Nombre de la alarma de latencia del origen de CloudFront"
  value       = aws_cloudwatch_metric_alarm.cloudfront_origin_latency.alarm_name
}


## Alarma por cantidad de solictudes
output "cloudfront_Request" {
  description = "Nombre de la alarma de cantidad de solicitudes de CloudFront"
  value       = aws_cloudwatch_metric_alarm.cloudfront_request
}
