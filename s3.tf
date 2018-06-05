# Create S3 bucket to ship logs to
resource "aws_s3_bucket" "logs" {
  bucket                    = "${var.log_bucket}"
  acl                       = "${var.log_bucket_acl}"
  force_destroy             = true
}

data "aws_iam_policy_document" "cross_account_access" {
	statement {
		sid = "CrossAccountWriteAccess"
		effect = "Allow"
		principals {
			type = "AWS"
			identifiers = "${var.log_bucket_ext_arns}"
		}
		actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:PutObject"
    ]
		resources = [
			"${aws_s3_bucket.logs.arn}",
			"${aws_s3_bucket.logs.arn}/*"
		]
	}
}

resource "aws_s3_bucket_policy" "logs" {
	bucket = "${aws_s3_bucket.logs.bucket}"
	policy = "${data.aws_iam_policy_document.cross_account_access.json}"
}
