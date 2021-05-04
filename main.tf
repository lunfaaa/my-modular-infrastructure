# main.tf
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = "eu-west-1"
  profile = "aws-personal"
}
