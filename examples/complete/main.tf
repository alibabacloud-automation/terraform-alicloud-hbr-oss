resource "alicloud_hbr_vault" "default" {
  vault_name = "tf-test-hbr-oss"
}

resource "alicloud_oss_bucket" "default" {
  bucket = "tf-test-hbr-oss"
}

data "alicloud_hbr_snapshots" "nas_snapshots" {
  source_type = "OSS"
  vault_id    = alicloud_hbr_vault.default.id
  bucket      = alicloud_oss_bucket.default.id
}

module "example" {
  source = "../.."


  #alicloud_hbr_oss_backup_plan
  create_backup_plan = true
  name               = var.name
  prefix             = var.prefix
  bucket             = alicloud_oss_bucket.default.id
  vault_id           = alicloud_hbr_vault.default.id
  schedule           = var.schedule
  retention          = var.retention

  #alicloud_hbr_restore_job
  create_restore_job = false
  snapshot_hash      = length(data.alicloud_hbr_snapshots.nas_snapshots.snapshots) > 0 ? data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_hash : var.snapshot_hash
  snapshot_id        = length(data.alicloud_hbr_snapshots.nas_snapshots.snapshots) > 0 ? data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_id : var.snapshot_id
  target_bucket      = alicloud_oss_bucket.default.id
  target_prefix      = var.target_prefix
  options            = "{\"includes\":[], \"excludes\":[]}"
}