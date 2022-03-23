#################
# Oss Backup Plan
#################
variable "name" {
  description = "The name of backup plan."
  type        = string
  default     = "tf-test-hbr-oss"
}

variable "prefix" {
  description = "Backup prefix. Once specified, only objects with matching prefixes will be backed up."
  type        = string
  default     = "/"
}

variable "schedule" {
  description = "(Required) Backup strategy. Optional format: I|{startTime}|{interval}. It means to execute a backup task every {interval} starting from {startTime}. The backup task for the elapsed time will not be compensated. If the last backup task has not completed yet, the next backup task will not be triggered.startTime Backup start time, UNIX time seconds.interval ISO8601 time interval. E.g: PT1H means one hour apart. P1D means one day apart."
  type        = string
  default     = "I|1646894763|PT2H"
}

variable "retention" {
  description = "(Required) Backup retention days, the minimum is 1."
  type        = number
  default     = 1
}

#################
# Oss Restore Job
#################
variable "snapshot_hash" {
  description = "(Required while create_restore_job is true, ForceNew) The hashcode of Snapshot."
  type        = string
  default     = ""
}

variable "snapshot_id" {
  description = "(Required while create_restore_job is true, ForceNew) The ID of Snapshot."
  type        = string
  default     = ""
}

variable "target_prefix" {
  description = "(Required while create_restore_job is true, ForceNew) The target prefix of the OSS object. WARNING: If this value filled in incorrectly, the task may not start correctly, so please check the parameters before executing the plan."
  type        = string
  default     = ""
}