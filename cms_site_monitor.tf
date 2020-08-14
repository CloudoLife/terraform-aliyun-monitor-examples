

# Alicloud: alicloud_cms_site_monitor - Terraform by HashiCorp
# https://www.terraform.io/docs/providers/alicloud/r/cms_site_monitor.html
resource "alicloud_cms_site_monitor" "billing_idea-tek_cn" {
    address = "https://billing.idea-tek.cn/login"
    task_name = "billing_idea-tek_cn"
    task_type = "HTTP"
    interval = 1
}
