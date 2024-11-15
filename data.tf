/*
####################################################################################################
# Terraform Data Blocks Configuration
#
# Project: Nemesia
# Description: Working with Glue Workflow using Terraform,
#              
#
# Author: Subhamay Bhattacharyya
# Created: 12-Nov-2024  Updated: 12-Nov-2024  14:27
# Version: 1.0
#
####################################################################################################
*/

# --- root/data.tf ---

# AWS Region and Caller Identity
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}