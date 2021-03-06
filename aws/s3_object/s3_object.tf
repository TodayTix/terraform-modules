resource "aws_s3_bucket_object" "object" {
    bucket = "${var.bucket}"
    key = "${var.dest}"
    source = "${var.file}"
    content = "${var.content}"
    content_base64 = "${var.encoded_content}"
    acl = "${var.acl}"
    cache_control = "${var.cache_control}"
    content_disposition = "${var.disposition}"
    content_encoding = "${var.encoding}"
    content_language = "${var.language}"
    content_type = "${var.mime_type}"
    website_redirect = "${var.redirect}"
    storage_class = "${var.storage_class}"
    etag = "${var.etag}"
    server_side_encryption = "${var.encryption}"
    kms_key_id = "${var.kms}"
    metadata = "${var.metadata}"
    force_destroy = "${var.force_destroy}"
    object_lock_legal_hold_status = "${var.object_lock}"
    object_lock_mode = "${var.lock_mode}"
    object_lock_retain_until_date = "${var.lock_retention}"
    tags = {
        Name = "${var.dest}"
        Description = "${var.description}"
        Environment = "${var.caller}"
        Service = "${var.svc}"
    }
    
    count = "${local.farm}"
}
