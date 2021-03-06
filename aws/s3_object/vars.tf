variable "caller" {}

variable "envname" {
    default = []
}

variable "description" {}

variable "svc" {
    default = "Generated by Terraform"
}

variable "bucket" {}

variable "dest" {}

variable "file" {
    default = null
}

variable "content" {
    default = null
}

variable "encoded_content" {
    default = null
}

variable "acl" {
    default = "private"
}

variable "cache_control" {
    default = null
}

variable "disposition" {
    default = null
}

variable "encoding" {
    default = null
}

variable "language" {
    default = "en-US"
}

variable "mime_type" {
    default = null
}

variable "redirect" {
    default = null
}

variable "storage_class" {
    default = null
}

variable "etag" {
    default = null
}

variable "encryption" {
    default = null
}

variable "kms" {
    default = null
}

variable "metadata" {
    default = null
}

variable "force_destroy" {
    default = "false"
}

variable "object_lock" {
    default = null
}

variable "lock_mode" {
    default = null
}

variable "lock_retention" {
    default = null
}

locals {
    scale = 1
    enabled = "${contains(var.envname,"${var.caller}")==true ? 1 : 0}"
    farm = "${local.scale * local.enabled}"
}
