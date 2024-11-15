/*
###################################################################################################
# Terraform Variables Configuration
#
# Description: This module creates a Glue ETL Job using Terraform.
#
# Author: Subhamay Bhattacharyya
# Created: 11-Nov-2024  Updated: 12-Nov-2024  9:44
# Version: 1.0
#
####################################################################################################
*/

######################################## AWS Configuration #########################################
variable "aws-region" {
  type    = string
  default = "us-east-1"
}

######################################## Project Name ##############################################
variable "project-name" {
  description = "The name of the project"
  type        = string
  default     = "gitops"
}

######################################## Environment Name ##########################################
variable "environment-name" {
  type        = string
  description = <<EOF
  (Optional) The environment in which to deploy our resources to.

  Options:
  - devl : Development
  - test: Test
  - prod: Production

  Default: devl
  EOF
  default     = "devl"

  validation {
    condition     = can(regex("^devl$|^test$|^prod$", var.environment-name))
    error_message = "Err: environment is not valid."
  }
}

######################################## Glue Job Configuration ####################################
# Glue Job base name
variable "glue-job-base-name" {
  description = "The base name of the Glue ETL Job"
  type        = string
}

# Glue ETL Job description
variable "glue-job-description" {
  description = "The description of the Glue ETL Job"
  type        = string
}

# The base name of the Glue script bucket
variable "glue-script-bucket-base-name" {
  description = "The base name of the Glue script S3 bucket"
  type        = string
}

# The Glue Job script name
variable "script-name" {
  description = "The name of the Glue ETL Job script"
  type        = string
}

# The base name of the Glue service role
variable "glue-job-role-name" {
  description = "The name of the Glue ETL Job role"
  type        = string
}

variable "execution-class" {
  description = "The execution class of the Glue ETL Job"
  type        = string
  default     = "STANDARD"
}

# Glue ETL job version
variable "glue-version" {
  description = "The version of the Glue ETL Job"
  type        = string
  default     = "1.0"
}

# Glue ETL Python version
variable "python-version" {
  description = "The Python version of the Glue ETL Job"
  type        = string
  default     = "3.0"
}

# Glue ETL Job command name
variable "glue-job-command-name" {
  description = <<EOF
  (Optional) The command name of the Glue ETL job.

  Options:
  - glueetl : Glue ETL
  - pythonshell: Python Shell


  Default: glueetl
  EOF
  default     = "glueetl"

  validation {
    condition     = can(regex("^glueetl$|^pythonshell$", var.glue-job-command-name))
    error_message = "Err: Glue Job command name is not valid."
  }
}

# Glue ETL job timeout in minutes
variable "glue-job-timeout" {
  description = "The timeout period for the Glue job"
  type        = number
  default     = 2880
}

# Glue ETL Job maximum capacity
variable "max-capacity" {
  description = "Glue Job max capacity"
  type        = number
  default     = 0.0625
}

# Glue ETL job worker type
variable "worker-type" {
  description = "The worker type of the Glue ETL Job"
  type        = string
  default     = null
}

# The number of workers of the Glue ETL Job
variable "number-of-workers" {
  description = "The number of workers of the Glue ETL Job"
  type        = number
  default     = 2
}

variable "max-concurrent-runs" {
  description = "Maximum allowed concurrent runs"
  type        = number
  default     = 1
}
# Default tags for the Glue Job
variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default = {
    Environment      = "devl"
    ProjectName      = "terraform-aws-glue"
    GitHubRepository = "test-repo"
    GitHubRef        = "refs/heads/main"
    GitHubURL        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    GitHubSHA        = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  }
}

# Glue Job default arguments
variable "default-arguments" {
  description = "A map of default arguments used by Glue ETL Job"
  type        = map(string)
  default     = null
}

# Glue Job security configuration
variable "glue-security-configuration-name" {
  description = "The security configuration name of the Glue ETL Job"
  type = string
  default = null
}

# Glue Job tags
variable "glue-job-tags" {
  description = "A map of tags to assign to the Glue ETL Job"
  type        = map(string)
  default     = null
}

######################################## GitHub ####################################################
# The CI build string
variable "ci-build" {
  description = "The CI build string"
  type        = string
  default     = "gitops"
}

######################################## Local Variables ###########################################
locals {
  glue-job-name           = "${var.project-name}-${var.glue-job-base-name}-${var.environment-name}-${var.aws-region}${var.ci-build}"
  glue-script-bucket-name = "${var.project-name}-${var.glue-script-bucket-base-name}-${var.environment-name}-${var.aws-region}${var.ci-build}"
}