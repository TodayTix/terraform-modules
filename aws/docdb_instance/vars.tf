variable "caller" {}

variable "envname" {
    default = []
}

variable "name" {}

variable "description" {}

variable "svc" {
    default = "Generated By Terraform"
}

variable "scale" {
    default = 1
}

variable "quick_changes" {
    default = null
}

variable "minor_upgrade" {
    default = true
}

variable "a_z" {
    default = null
}

variable "cluster_id" {}

variable "engine" {
    default = "docdb"
}

variable "size" {
    default = "db.r4.large"
}

variable "maintenance_window" {
    default = null
}

variable "tier" {
    default = 0
}

locals {
    enabled = "${contains(var.envname,"${var.caller}")==true ? 1 : 0}"
    farm = "${var.scale * local.enabled}"
}
