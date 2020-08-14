
# Alicloud does not support notify_type and may result in a bug about recreate new alrm rule while update alrm rule.

# Alicloud: alicloud_cms_alarm - Terraform by HashiCorp
# https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html
resource "alicloud_cms_alarm" "cpu_total" {
  name    = "cpu_total"
  project = "acs_ecs_dashboard"
  # Alibaba Cloud Document Center: Find the Documentation for Your Needs - Alibaba Cloud
  # https://www.alibabacloud.com/help/zh/doc-detail/28619.htm   
  metric  = "cpu_total"
  dimensions = {
    # Remember to replace <Your ECS instance id>".
    instanceId = "<Your ECS instance id>"
  }
  statistics      = "Maximum"
  period          = 60
  operator        = ">="
  threshold       = 70
  triggered_count = 1
  contact_groups  = ["contact_groups"]
#   effective_interval = "00:00-23:59"
#   notify_type     = 1
#   enabled = true
#   webhook         = "https://${data.alicloud_account.current.id}.eu-central-1.fc.aliyuncs.com/2016-08-15/proxy/Terraform/AlarmEndpointMock/"
}

# Alicloud: alicloud_cms_alarm - Terraform by HashiCorp
# https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html
resource "alicloud_cms_alarm" "memory_usedutilization" {
  name    = "memory_usedutilization"
  project = "acs_ecs_dashboard"
  # Alibaba Cloud Document Center: Find the Documentation for Your Needs - Alibaba Cloud
  # https://www.alibabacloud.com/help/zh/doc-detail/28619.htm   
  metric  = "memory_usedutilization"
  dimensions = {
    # Remember to replace <Your ECS instance id>".
    instanceId = "<Your ECS instance id>"
  }
  statistics      = "Maximum"
  period          = 60
  operator        = ">="
  threshold       = 70
  triggered_count = 1
  contact_groups  = ["contact_groups"]
#   effective_interval = "00:00-23:59"
#   notify_type     = 1
#   enabled = true
#   webhook         = "https://${data.alicloud_account.current.id}.eu-central-1.fc.aliyuncs.com/2016-08-15/proxy/Terraform/AlarmEndpointMock/"
}

# Alicloud: alicloud_cms_alarm - Terraform by HashiCorp
# https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html
resource "alicloud_cms_alarm" "diskusage_utilization" {
  name    = "diskusage_utilization"
  project = "acs_ecs_dashboard"
  # Alibaba Cloud Document Center: Find the Documentation for Your Needs - Alibaba Cloud
  # https://www.alibabacloud.com/help/zh/doc-detail/28619.htm   
  metric  = "diskusage_utilization"
  dimensions = {
    # Remember to replace <Your ECS instance id>".
    instanceId = "<Your ECS instance id>"
    # device     = "/dev/vda1"
  }
  statistics      = "Maximum"
  period          = 60
  operator        = ">="
  threshold       = 70
  triggered_count = 1
  contact_groups  = ["contact_groups"]
#   effective_interval = "00:00-23:59"
#   notify_type     = 1
  enabled = true
#   webhook         = "https://${data.alicloud_account.current.id}.eu-central-1.fc.aliyuncs.com/2016-08-15/proxy/Terraform/AlarmEndpointMock/"
}