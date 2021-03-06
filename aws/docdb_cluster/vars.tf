variable "caller" {}

variable "envname" {
    default = []
}

variable "name" {}

variable "description" {}

variable "svc" {
    default = "Generated By Terraform"
}

variable "quick_changes" {
    default = null
}

variable "a_zs" {
    default = null
}

variable "retention_period" {
    default = null
}

variable "subnet_group" {
    default = null
}

variable "parameter_group" {
    default = null
}

variable "cloudwatch_exports" {
    default = null
}

variable "engine_version" {
    default = null
}

variable "engine" {
    default = "docdb"
}

variable "final_snapshot_id" {
    default = null
}

variable "kms" {
    default = null
}

variable "password" {}

variable "username" {}

variable "port" {
    default = 27017
}

variable "backup_window" {
    default = null
}

variable "skip_final_snapshot" {
    default = true
}

variable "snapshot_id" {
    default = null
}

variable "encrypt" {
    default = false
}

variable "sec_groups" {
    default = null
}

locals {
    scale = 1
    enabled = "${contains(var.envname,"${var.caller}")==true ? 1 : 0}"
    farm = "${local.scale * local.enabled}"
}
