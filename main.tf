resource "alicloud_hbr_oss_backup_plan" "backup_plan" {
  count                = var.create_backup_plan ? 1 : 0
  oss_backup_plan_name = var.name
  prefix               = var.prefix
  bucket               = var.bucket
  vault_id             = var.vault_id
  schedule             = var.schedule
  backup_type          = "COMPLETE"
  retention            = var.retention
}

resource "alicloud_hbr_restore_job" "restore_job" {
  count         = var.create_restore_job ? 1 : 0
  snapshot_hash = var.snapshot_hash
  vault_id      = var.vault_id
  source_type   = "OSS"
  restore_type  = "OSS"
  snapshot_id   = var.snapshot_id
  target_bucket = var.target_bucket
  target_prefix = var.target_prefix
  options       = var.options
}

