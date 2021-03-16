variable "caller" {}

variable "envname" {
    default = []
}

variable "name" {}

variable "description" {}

variable "svc" {
    default = "Generated by Terraform"
}

variable "aliases" {
    default = null
}

variable "error_msg" {
    default = []
}

variable "default_cache_behavior" {
    default = {}
}

variable "default_root_object" {
    default = null
}

variable "enabled" {
    default = "true"
}

variable "ipv6" {
    default = "false"
}

variable "http_version" {
    default = "http2"
}

variable "logging_config" {
    default = []
}

variable "ordered_cache_behavior" {
    default = []
}

variable "origins" {
    default = []
}

variable "origin_groups" {
    default = []
}

variable "price_class" {
    default = "PriceClass_All"
}

variable "restriction" {
    default = "none"
}

variable "restriction_locations" {
    default = []
}

variable "viewer_certificate" {
    default = {}
}

variable "waf" {
    default = null
}

variable "retain" {
    default = "false"
}

variable "wait_for_deploy" {
    default = "true"
}

locals {
    defaults = {
        default_cache_behavior = {
            allowed_methods = ["HEAD","GET"]
            cached_methods = ["HEAD","GET"]
            compress = null
            default_ttl = 600
            field_level_encryption_id = null
            forwarded_values = {
                cookies = {
                    forward = "none"
                    whitelisted_names = null
                }
                headers = null
                query_string = false
                query_string_cache_keys = null
            }
            lambda_function_association = []
            max_ttl = null
            min_ttl = null
            path_pattern = "*"
            smooth_streaming = null
            target_origin_id = ""
            trusted_signers = null
            viewer_protocol_policy = "allow-all"
        }
        lambda_function_association = {
            event_type = "viewer_request"
            lambda_arn = ""
            include_body = false
        }
        origin = {
            origin_id = "${var.name}"
            origin_path = null
            domain_name = "${var.name}"
            custom_header = []
            custom_origin_config = []
            s3_origin_config = []
        }
        custom_origin_config = {
            http_port = 80
            https_port = 443
            origin_protocol_policy = "https-only"
            origin_ssl_protocols = "TLSv1.1"
            origin_keepalive_timeout = null
            origin_read_timeout = null
        }
        s3_origin_config = {
            origin_access_identity = null
        }
        origin_group = {
            origin_id = "${var.name}-group"
            failover_criteria = {
                status_codes = []
            }
            member = []
        }
        member = {
            origin_id = ""
        }
        viewer_certificate = {
            acm_certificate_arn = null
            cloudfront_default_certificate = null
            iam_certificate_id = null
            minimum_protocol_version = "TLSv1"
            ssl_support_method = null
        }
        logging_config = {
            bucket = ""
            include_cookies = false
            prefix = null
        }
    }
    merged = {
        default_cache_behavior = "${merge(local.defaults.default_cache_behavior,var.default_cache_behavior)}"
        viewer_certificate = "${merge(local.defaults.viewer_certificate,var.viewer_certificate)}"
    }
    merged_cache = {
        forwarded_values = "${merge(local.defaults.default_cache_behavior.forwarded_values,local.merged.default_cache_behavior.forwarded_values)}"
    }
    merged_forward = {
        cookies = "${merge(local.defaults.default_cache_behavior.forwarded_values.cookies,local.merged_cache.forwarded_values.cookies)}"
    }
    scale = 1
    enabled = "${contains(var.envname,"${var.caller}")==true ? 1 : 0}"
    farm = "${local.scale * local.enabled}"
}