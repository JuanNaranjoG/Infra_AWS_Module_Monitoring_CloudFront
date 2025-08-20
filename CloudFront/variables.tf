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
  type        = map(string)
  default     = {}
  description = "SNS topic ARN para notificaciones"
}


###############################
# Variables por métrica
###############################

## 5xxErrorRate
variable "cf_5xx_threshold" {
  type    = number
  default = 10
}

variable "cf_5xx_period" {
  type    = number
  default = 300
}

variable "cf_5xx_evaluation_periods" {
  type    = number
  default = 1
}

## OriginLatency
variable "cf_origin_latency_threshold" {
  type    = number
  default = 80
}

variable "cf_origin_latency_period" {
  type    = number
  default = 300
}

variable "cf_origin_latency_evaluation_periods" {
  type    = number
  default = 1
}

## FunctionExecutionErrors
variable "cf_function_errors_threshold" {
  type    = number
  default = 0
}

variable "cf_function_errors_period" {
  type    = number
  default = 300
}

variable "cf_function_errors_evaluation_periods" {
  type    = number
  default = 1
}
