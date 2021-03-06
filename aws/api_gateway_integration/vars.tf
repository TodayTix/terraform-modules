variable "caller" {}

variable "envname" {
    default = []
}

variable "rest_api" {}

variable "resource_id" {}

variable "http_method" {}

variable "integration_method" {
    default = null
}

variable "type" {}

variable "connection_type" {
    default = null
}

variable "connection_id" {
    default = null
}

variable "uri" {
    default = null
}

variable "credentials" {
    default = null
}

variable "request_templates" {
    default = null
}

variable "request_parameters" {
    default = null
}

variable "passthrough_behavior" {
    default = null
}

variable "cache_key_parameters" {
    default = null
}

variable "cache_namespace" {
    default = null
}

variable "content_handling" {
    default = null
}

variable "timeout" {
    default = null
}

locals {
    scale = 1
    enabled = "${contains(var.envname,"${var.caller}")==true ? 1 : 0}"
    farm = "${local.scale * local.enabled}"
}
