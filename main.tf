### BASIC ENVIRONMENT CONFIGURATION ###
# Configure and set AWS S3 Backend for statefile
terraform {
  backend "s3" {
    bucket                  = "tf-aws-elk_state"
    key                     = "tfstates/elk/terraform.tfstate"
    region                  = "eu-central-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "dev"
  }
}

# Configure Terraform AWS Provider
#  - we use a shared (awscli) credentials file
#  - we use a profile from shared credentials file
provider "aws" {
  region                    = "${var.region}"
  shared_credentials_file   = "${var.shared_credentials_file}"
  profile                   = "${var.profile}"
}
