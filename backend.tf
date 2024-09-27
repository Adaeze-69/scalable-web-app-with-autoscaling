terraform {
  backend "s3" {
    bucket         = "ada-state-bucket"
    key            = "global/s3/terraform-1.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ada-state-lock-table"
    encrypt        = true
  }
}