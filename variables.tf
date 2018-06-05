# AWS Provider Credentials
variable region {}
variable shared_credentials_file {}
variable profile {}

# S3 bucket to ship logs
variable log_bucket {
  description = "Bucket to put logs"
  default = "tf-logshipping"
}
variable log_bucket_acl {
  default = "private"
}
variable log_bucket_ext_arns { type = "list" }
# Create S3 bucket for ElasticSearch snapshots
variable es_backup_bucket {
  description = "Bucket to put logs"
  default = "tf-es-backup"
}
variable es_backup_bucket_acl {
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
variable snapshot_start_hour {}
variable management_public_ip_addresses { type = "list"}

# Logstash EC2 Options
variable logstash_ami {}
variable logstash_instance_type {}
variable logstash_subnet_id {}
variable logstash_subnet_ids {}
variable key_name {}
variable ec2_user {
  description = "User to establish ssh connections"
  default = "ec2-user"
}
variable logstash_interval {}
variable logstash_delete {}
variable logstash_instance_count {}
variable logstash_prefix {}
