###############################
# Variables generales
###############################

variable "cloudfront_distribution" {
   description = "ID de la distribución de CloudFront a monitorear"
   type        = string
}

variable "project" {
  type = string
}

variable "bdo_name_service" {
  type = string
}

variable "purpose" {
  type = string
}

variable "bdo_environment" {
  type = string
}

variable "alarm_actions" {
  type        = list(string)
  default     = []
  description = "Lista de ARNs a notificar cuando una alarma se dispare"
}

variable "ok_actions" {
  type        = list(string)
  default     = []
  description = "Lista de ARNs a notificar cuando una alarma vuelva a estado OK"
}

variable "resource_adicional_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas adicionales no obligatorias"
}

variable "resource_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas Bdo - Etiquetas Aval"
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS topic ARN para notificaciones"
}


###############################
# Variables por métrica
###############################

## 5xxError

variable "cloudfront_5xx_error_evaluation_periods" {
  type    = number
  default = 3 # Periodos por cada evaluacion antes de generar la alarma 3 * 120 = 360
}

variable "cloudfront_5xx_error_events_period" {
  type    = number
  default = 120 # Valor en segundos = 2 minutos
}

variable "cloudfront_5xx_error_threshold" {
  type    = number
  default = 5 # Equivale al 5% de tasa de error durante los periodos validados

}

## 4xxError

variable "cloudfront_4xx_error_evaluation_periods" {
  type    = number
  default = 5 # Periodos por cada evaluacion antes de generar la alarma 3 * 100 = 300
}

variable "cloudfront_4xx_error_events_period" {
  type    = number
  default = 60 # Valor en segundos = 1 minuto
}

variable "cloudfront_4xx_error_threshold" {
  type    = number
  default = 2 # Equivale al 2% de tasa de error durante los periodos validados
}

## Originlantency

variable "cloudfront_origin_lantency_evaluation_periods" {
  type    = number
  default = 5 # Periodos por cada evaluacion antes de generar la alarma 3 * 100 = 30
}

variable "cloudfront_origin_lantency_events_period" {
  type    = number
  default = 60 # Valor en segundos = 1 minuto
}

variable "cloudfront_origin_lantency_threshold" {
  type    = number
  default = 1000 #  1000 segundos durante los periodos validados
}

## Request

variable "cloudfront_request_evaluation_periods" {
  type    = number
  default = 5 # Periodos por cada evaluacion antes de generar la alarma 3 * 100 = 300
}

variable "cloudfront_request_events_period" {
  type    = number
  default = 60 # Valor en segundos = 1 minuto
}

variable "cloudfront_request_threshold" {
  type    = number
  default = 10000 # 10000 solicitudes durante los periodos validados
}
