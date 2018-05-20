# AWS Provider Credentials
region                    = "eu-central-1"
shared_credentials_file   = "~/.aws/credentials"
profile                   = "dev"

# S3 bucket to ship logs
log_bucket                = "tf-aws-elk-logshipping"
log_bucket_acl            = "private"

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
ec2_user                  = "ec2-user"
s3_interval               = 60
