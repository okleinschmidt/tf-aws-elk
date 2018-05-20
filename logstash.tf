### EC2 instance running Logstash ###

# Create logstash config files
resource "template_dir" "logstash" {
  source_dir                = "${path.module}/templates/logstash"
  destination_dir           = "${path.cwd}/configs/logstash"
  vars {
    elasticsearch_address   = "${module.es.endpoint}"
    s3_region               = "${var.region}"
    s3_access_key_id        = "${aws_iam_access_key.logstash.id}"
    s3_secret_access_key    = "${aws_iam_access_key.logstash.secret}"
    s3_bucket               = "${var.log_bucket}"
    s3_interval             = "${var.s3_interval}"
  }
}

# Create yum config files for LogStash repository
resource "template_dir" "repos" {
  source_dir                = "${path.module}/templates/yum.repos.d"
  destination_dir           = "${path.cwd}/configs/yum.repos.d"
}

# Create EC2 instance, upload generated config files
resource "aws_instance" "logstash" {
  ami                       = "${var.logstash_ami}"
  instance_type             = "${var.logstash_instance_type}"
  vpc_security_group_ids    = "${var.security_group_ids}"
  subnet_id                 = "${var.logstash_subnet_id}"
  key_name                  = "${var.key_name}"
  provisioner "file" {
    source                  = "${template_dir.logstash.destination_dir}"
    destination             = "/tmp/logstash"
    connection {
      user                  = "${var.ec2_user}"
    }
  }
  provisioner "file" {
    source                  = "${template_dir.repos.destination_dir}"
    destination             = "/tmp/yum.repos.d"
    connection {
      user                  = "${var.ec2_user}"
    }
  }

  provisioner "file" {
    source      = "templates/install.sh"
    destination = "/tmp/install.sh"
    connection {
      user                  = "${var.ec2_user}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "/tmp/install.sh",
    ]
    connection {
      user                  = "${var.ec2_user}"
    }
  }
}
