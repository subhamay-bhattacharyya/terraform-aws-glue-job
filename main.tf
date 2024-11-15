/*
####################################################################################################
# Terraform Glue Job Configuration
#
# Description: This module creates a Glue ETL Job using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 11-Nov-2024  Updated: 13-Nov-2024  14:45
# Version: 1.0
#
####################################################################################################
*/

# --- Glue Job
resource "aws_glue_job" "glue_job" {

  name                   = local.glue-job-name
  description            = var.glue-job-description
  role_arn               = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.glue-job-role-name}"
  execution_class        = var.glue-job-command-name == "glueetl" ? var.execution-class : null
  glue_version           = var.glue-job-command-name == "glueetl" ? var.glue-version : null
  worker_type            = var.glue-job-command-name == "glueetl" ? var.worker-type : null
  number_of_workers      = var.glue-job-command-name == "glueetl" ? var.number-of-workers : null
  max_capacity           = var.max-capacity
  timeout                = var.glue-job-timeout
  security_configuration = var.glue-security-configuration-name
  execution_property {
    max_concurrent_runs = var.max-concurrent-runs
  }

  command {
    name            = var.glue-job-command-name # "glueetl"
    script_location = join("/", ["s3:/", local.glue-script-bucket-name, "glue-scripts", var.script-name])
    python_version  = var.python-version
  }

  default_arguments = var.default-arguments == null ? {} : var.default-arguments

  tags = var.glue-job-tags == null ? {} : var.glue-job-tags
}