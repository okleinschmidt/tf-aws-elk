# AWS Provider Credentials
region                    = "eu-central-1"
shared_credentials_file   = "~/.aws/credentials"
profile                   = "dev"

# S3 bucket to ship logs
log_bucket                = "tf-aws-elk-logs"
log_bucket_acl            = "private"
# Uncomment line below to enable CrossAccountWriteAccess
# log_bucket_ext_arns       = ["arn:aws:iam::XXXXXXXXXXX:root", "arn:aws:iam::XXXXXXXXXXX:root"]

# ElasticSearch Options
domain_name               = "elk-test"
security_group_ids        = [""]
subnet_ids                = [""]
instance_count            = 2
instance_type             = "t2.small.elasticsearch"
dedicated_master_type     = "t2.small.elasticsearch"
es_version                = "6.2"
es_zone_awareness         = false
ebs_volume_size           = 10

# Logstash EC2 Options
logstash_ami              = "ami-9a91b371"
logstash_instance_type    = "t2.micro"
key_name                  = ""
logstash_subnet_id        = ""
logstash_subnet_ids       = ""
ec2_user                  = "ec2-user"
logstash_interval         = 60
logstash_delete           = "false"
logstash_instance_count   = 1
logstash_prefix           = "logstash"
