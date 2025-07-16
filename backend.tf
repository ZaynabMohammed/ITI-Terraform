terraform {
  backend "s3" {
    bucket         = "infra-lockstate"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "LockState-table"

  }
}
