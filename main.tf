# main.tf
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = "eu-east-1"
  profile = "aws-personal"
}
