terraform {
    
  backend "s3" {
    bucket = "teststatefilebuckets3"
    key    = "terraform.tfstate"
    region = "ap-south-2"
  }
}