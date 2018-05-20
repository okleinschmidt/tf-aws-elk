# Create S3 bucket to ship logs to
resource "aws_s3_bucket" "logshipping" {
  bucket                    = "${var.log_bucket}"
  acl                       = "${var.log_bucket_acl}"
  force_destroy             = true
}
