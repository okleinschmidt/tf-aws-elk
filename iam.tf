# Create IAM Policy Document -> logstash
#  - allow getting documents from bucket
#  - allow listing bucket
data "aws_iam_policy_document" "logstash" {
      statement {
           effect = "Allow"
           actions = [
           "s3:Get*",
           "s3:List*"
       ]
       resources = ["*"]
    }
}

# Create IAM User Policy with above defined Policy Document -> logstash
resource "aws_iam_user_policy" "logstash" {
  name = "logstash"
  user = "${aws_iam_user.logstash.name}"
  policy = "${data.aws_iam_policy_document.logstash.json}"
}

# Create IAM User to access bucket -> logstash
resource "aws_iam_user" "logstash" {
  name = "logstash"
}

# Create IAM access for above created IAM User -> logstash
resource "aws_iam_access_key" "logstash" {
  user    = "${aws_iam_user.logstash.name}"
}

# Create S3 access policy for ElasticSearch Service
data "aws_iam_policy_document" "es_s3_repo" {
    statement {
           effect = "Allow"
           actions = [
             "es:ESHttpPut"
           ]
       resources = ["${module.es.arn}/*"]
    }
    statement {
           effect = "Allow"
           actions = [
             "s3:ListBucket"
           ]
       resources = ["${aws_s3_bucket.logs.arn}"]
    }
    statement {
           effect = "Allow"
           actions = [
             "s3:GetObject",
             "s3:PutObject",
             "s3:DeleteObject",
             "iam:PassRole"
           ]
       resources = ["${aws_s3_bucket.logs.arn}/*"]
    }
}

resource "aws_iam_policy" "es_s3_repo" {
  name   = "es_s3_repo"
  path   = "/"
  policy = "${data.aws_iam_policy_document.es_s3_repo.json}"
}

# Create S3 access role for ElasticSearch Service
data "aws_iam_policy_document" "es_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["es.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "es_s3_repo" {
  name               = "es_s3_repo"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.es_assume_role_policy.json}"
}

resource "aws_iam_role_policy_attachment" "es_s3_repo" {
    role       = "${aws_iam_role.es_s3_repo.name}"
    policy_arn = "${aws_iam_policy.es_s3_repo.arn}"
}
