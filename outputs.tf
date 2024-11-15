/*
/*
####################################################################################################
# Terraform Glue Job Outputs Configuration
#
# Description: This module creates a Glue ETL Job using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 11-Nov-2024  Updated: 12-Nov-2024  9:44
# Version: 1.0
#
####################################################################################################
*/


output "glue_job_arn" {
  description = "The ARN of the Glue ETL Job"
  value       = aws_glue_job.glue_job.arn
}

output "glue_job_id" {
  description = "The name of the Glue ETL Job"
  value       = aws_glue_job.glue_job.id
}

output "glue_tags_all" {
  description = "The tags of the Glue ETL Job"
  value       = aws_glue_job.glue_job.tags_all
}
