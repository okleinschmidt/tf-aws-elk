### ElasticSearch deployment ###
#
# We use tf_aws_elasticsearch to simplify access config etc.
module "es" {
  source                    = "github.com/terraform-community-modules/tf_aws_elasticsearch"
  domain_name               = "${var.domain_name}"
  vpc_options = {
    security_group_ids      = "${var.security_group_ids}"
    subnet_ids              = "${var.subnet_ids}"
  }
  instance_count            = "${var.instance_count}"
  instance_type             = "${var.instance_type}"
  dedicated_master_type     = "${var.dedicated_master_type}"
  es_version                = "${var.es_version}"
  es_zone_awareness         = "${var.es_zone_awareness}"
  ebs_volume_size           = "${var.ebs_volume_size}"
}
