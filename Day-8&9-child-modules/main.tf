module "vpc" {
  source = "./modules/vpc"
  cidr-block = "10.0.0.0/16"
  subnet-cidr = "10.0.1.0/24"
  availability-zone = "us-east-1a"
}


module "ec2" {
  source = "./modules/ec2"
  ami_id = "ami-04f617474d20eae29"
  instance_type = "t3.micro"
  instance_name = "terraform-instance"
  subnet_id = module.vpc.subnet_id
}

module "rds" {
  source = "./modules/rds"
  subnet_id = module.vpc.subnet_id
  instance_class = "db.t2.micro"
  db_name = "mydb"
  username = "admin"
  password = "password123"
}