
# Terraform Aliyun Monitor Example

Examples about using Terraform Alibaba Cloud Provider to manage alarm rules and monitor sites.

Github: [https://github.com/CloudoLife/terraform-aliyun-monitor-example](https://github.com/CloudoLife/terraform-aliyun-monitor-example)

## Prerequsites
Your must have a Alibaba Cloud account with Access Key, and Terraform CLI have been installed.

### Aliyun Account and Access Key

- [Alibaba Cloud Document Center: Find the Documentation for Your Needs - Alibaba Cloud](https://www.alibabacloud.com/help/doc-detail/50482.htm)

    Before you purchase and use Alibaba Cloud products and services, you must have an Alibaba Cloud account. And then configure the account.

- [Create an AccessKey - General Reference| Alibaba Cloud Documentation Center](https://www.alibabacloud.com/help/doc-detail/53045.htm)

    An AccessKey is equivalent to a logon password, but they are used in different scenarios. AccessKeys are used to directly call APIs, while logon passwords are used to log on to the console. You must create an AccessKey only if you must call APIs.

### Terrraform and Terrafrom Aliyun Provider

- [Terraform by HashiCorp](https://www.terraform.io/)

    Use Infrastructure as Code to provision and manage any cloud, infrastructure, or service

- [Provider: alicloud - Terraform by HashiCorp](https://www.terraform.io/docs/providers/alicloud/index.html)

    The Alibaba Cloud provider is used to interact with the many resources supported by Alibaba Cloud. The provider needs to be configured with the proper credentials before it can be used.

## Configuration

### Profile and Region
First, Specify your Aliyun(AliCloud - Alibaba Cloud) profile and region within [terraform.tfvars](./terraform.tfvars).

```terraform
profile = "default"

region = "cn-shanghai"
```

### CMS Alarm Rules
See more within [cms_alarm.tf](./cms_alarm.tf).

```terraform
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
```

### CMS Site Monitor
See more within [cms_site_monitor.tf](./cms_site_monitor.tf).

```terraform
# Alicloud: alicloud_cms_site_monitor - Terraform by HashiCorp
# https://www.terraform.io/docs/providers/alicloud/r/cms_site_monitor.html
resource "alicloud_cms_site_monitor" "site" {
    address = "https://blog.cloudolife.com"
    task_name = "blog_cloudolife_com"
    task_type = "HTTP"
    interval = 1
}
```

## Run

### Terraform Init

```bash
terraform init
```

It will download the Terraform Alibaba Cloud Provider binary.

### Terraform apply
```bash
terraform apply
```

It will dispaly the execute plan and wait for your make yes or no.

## Known issues

- alicloud_cms_alarm 'notify_type' has been removed from provider version 1.50.0. 
Because currently Terraform Alibaba Cloud Provider only supports the setting of Critical rules, other levels are not yet supported.

    ```bash
    Error: "notify_type": [REMOVED] Field 'notify_type' has been removed from provider version 1.50.0.

    on main.tf line 6, in resource "alicloud_cms_alarm" "basic":
    6: resource "alicloud_cms_alarm" "basic" {
    ```

- May auto create a new alarm rule while update the some alarm rules provided by Terrraform within AliCloud Web Console.

- Config alarm rule within alicloud_cms_site_monitor is not supported.

# Reference
[1] [Provider: alicloud - Terraform by HashiCorp - https://www.terraform.io/docs/providers/alicloud/index.html](https://www.terraform.io/docs/providers/alicloud/index.html)

[2] [terraform-providers/terraform-provider-alicloud: This has moved to https://github.com/aliyun/terraform-provider-alicloud - https://github.com/terraform-providers/terraform-provider-alicloud](https://github.com/terraform-providers/terraform-provider-alicloud)

[3] [Terraform-阿里云 - https://help.aliyun.com/product/95817.html](https://help.aliyun.com/product/95817.html)

[4] [OpenAPI Explorer - https://api.aliyun.com/#/cli?tool=Terraform](https://api.aliyun.com/#/cli?tool=Terraform)

