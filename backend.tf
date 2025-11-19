terraform {
  backend "s3" {
    bucket         = "exemplifi-test-ap-northeast-1"
    key            = "test.tfstate"
    region         = "ap-northeast-1"
  }
}

