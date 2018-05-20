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
