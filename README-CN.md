Terraform module which creates Hybrid Backup Recovery (HBR) for OSS on Alibaba Cloud.

terraform-alicloud-hbr-oss
=====================================================================

[English](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbr-oss/blob/main/README.md) | 简体中文

本 Module 用于基于HBR自动化构建OSS备份和恢复计划，包含：`HBR`。

本 Module 支持创建以下资源:

* [alicloud_hbr_oss_backup_plan](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_oss_backup_plan)
* [alicloud_hbr_restore_job](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/hbr_restore_job)

## 用法

```hcl
module "example" {
  source             = "terraform-alicloud-modules/hbr-oss/alicloud"
  create_backup_plan = true
  name               = "tf-test-hbr-oss"
  bucket             = "tf-test-hbr-oss"
  prefix             = "/"
  schedule           = "I|1646827682|PT2H"
  backup_type        = "COMPLETE"
  vault_id           = "v-0006******q"
  retention          = 1
  create_restore_job = false
}
```

## 示例

* [HBR 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-hbr-oss/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.133.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.133.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
