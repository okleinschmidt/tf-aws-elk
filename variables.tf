# AWS Provider Credentials
variable region {}
variable shared_credentials_file {}
variable profile {}

# S3 bucket to ship logs
variable log_bucket {
  description = "Bucket to put logs"
  default = "logshipping"
}
variable log_bucket_acl {
  default = "private"
}

# ElasticSearch VPC Options
variable domain_name {}
variable security_group_ids {
  type = "list"
}
variable subnet_ids {
  type = "list"
}
variable instance_count {}
variable instance_type {}
variable dedicated_master_type {}
variable es_version {}
variable es_zone_awareness {}
variable ebs_volume_size {}

# Logstash EC2 Options
variable logstash_ami {}
variable logstash_instance_type {}
variable logstash_subnet_id {}
variable key_name {}
variable ec2_user {
  description = "User to establish ssh connections"
  default = "ec2-user"
}
variable s3_access_key_id {}
variable s3_secret_access_key {}
variable s3_interval {}
