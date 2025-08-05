###############################
# Variables generales
###############################

variable "cloudfront_distributions" {
  description = "Mapa con alias lógico => DistributionId"
  type        = map(string)
}

variable "project" {
  type = string
}

variable "name_service" {
  type = string
}

variable "environment" {
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

variable "resource_tags" {
  type        = map(string)
  default     = {}
  description = "Etiquetas adicionales para las alarmas"
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
