![](https://img.shields.io/github/commit-activity/t/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/last-commit/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/release-date/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/repo-size/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/directory-file-count/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/issues/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/languages/top/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/github/commit-activity/m/subhamay-bhattacharyya/terraform-aws-glue-job)&nbsp;![](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bsubhamay/bd4e53c3a8f5097b10611aef73f6568c/raw/terraform-aws-glue-job.json?)

# Terraform AWS Glue Job

This Terraform module creates an AWS Glue Job with various configurations.

## Usage

```hcl
module "glue_etl_job" {
  source   = "app.terraform.io/subhamay-bhattacharyya/glue-job/aws"
  version  = "1.0.0"

  aws-region                       = "us-east-1"
  project-name                     = "your-project"
  environment-name                 = "your-environment"
  glue-job-base-name               = "example-glue-job"
  glue-job-description             = "An example Glue ETL Job"
  glue-script-bucket-base-name     = "example-script-bucket"
  script-name                      = "example-script.py"
  glue-job-role-name               = "example-glue-role"
  execution-class                  = "STANDARD"
  glue-version                     = "2.0"
  python-version                   = "3.0"
  glue-job-command-name            = "glueetl"
  glue-job-timeout                 = 2880
  max-capacity                     = 0.0625
  worker-type                      = "Standard"
  number-of-workers                = 2
  max-concurrent-runs              = 1
  default-arguments = {
    "--job-bookmark-option" = "job-bookmark-enable"
    "--enable-metrics"      = "true"
  }
  glue-security-configuration-name = "security-configuration-name"
  glue-job-tags                   = {
    Environment      = "dev"
    ProjectName      = "example-project"
    GitHubRepository = "example-repo"
    GitHubRef        = "refs/heads/main"
    GitHubURL        = "https://github.com/example/example-repo"
    GitHubSHA        = "example-sha"
  }
  ci-build = ""
}
```

## Inputs

| Name                      | Description                                                     | Type          | Default     | Required |
|---------------------------|-----------------------------------------------------------------|---------------|-------------|----------|
| aws-region                | The AWS region to deploy resources                              | string        | "us-east-1" | no       |
| project-name              | The name of the project                                         | string        | "gitops"    | no       |
| environment-name          | The environment in which to deploy resources                    | string        | "devl"      | no       |
| glue-job-base-name        | The base name of the Glue ETL Job                               | string        | n/a         | yes      |
| glue-job-description      | The description of the Glue ETL Job                             | string        | n/a         | yes      |
| glue-script-bucket-base-name | The base name of the Glue script S3 bucket                   | string        | n/a         | yes      |
| script-name               | The name of the Glue ETL Job script                             | string        | n/a         | yes      |
| glue-job-role-name        | The name of the Glue ETL Job role                               | string        | n/a         | yes      |
| execution-class           | The execution class of the Glue ETL Job                         | string        | "STANDARD"  | no       |
| glue-version              | The version of the Glue ETL Job                                 | string        | "2.0"       | no       |
| python-version            | The Python version of the Glue ETL Job                          | string        | "3.0"       | no       |
| glue-job-command-name     | The command name of the Glue ETL job                            | string        | "glueetl"   | no       |
| glue-job-timeout          | The timeout period for the Glue job                             | number        | 2880        | no       |
| max-capacity              | Glue Job max capacity                                           | number        | 0.0625      | no       |
| worker-type               | The worker type of the Glue ETL Job                             | string        | null        | no       |
| number-of-workers         | The number of workers of the Glue ETL Job                       | number        | 2           | no       |
| max-concurrent-runs       | Maximum allowed concurrent runs                                 | number        | 1           | no       |
| default-arguments         | A map of default arguments used by Glue ETL Job                 | map(string)   | {}          | no       |
| glue-security-configuration-name    | Security configuration for the Glue ETL Job           | string        | ""          | no       |
| glue-job-tags             | A map of tags to assign to the Glue ETL Job                     | map(string)   | {}          | no       |
| ci-build                  | CI build identifier                                             | string        | ""          | no       |

## Outputs

| Name                      | Description                                                     |
|---------------------------|-----------------------------------------------------------------|
| glue-job-id               | The ID of the created Glue ETL Job                              |
| glue-job-name             | The name of the created Glue ETL Job                            |
| glue-job-arn              | The ARN of the created Glue ETL Job                             |
| glue-job-role-arn         | The ARN of the IAM role associated with the Glue ETL Job        |
| glue-job-script-location  | The S3 location of the Glue ETL Job script                      |
| glue-job-security-config  | The security configuration of the Glue ETL Job                  |