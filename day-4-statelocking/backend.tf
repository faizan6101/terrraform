terraform {
    
  backend "s3" {
    bucket = "teststatefilebuckets3"
    key    = "day-4/terraform.tfstate"
    region = "ap-south-2"
  }
}