
# Provider: alicloud - Terraform by HashiCorp
# https://www.terraform.io/docs/providers/alicloud/index.html
# Configure the Alicloud Provider
provider "alicloud" {

  profile = var.profile

  region = var.region
}


