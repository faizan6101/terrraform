module "test"{
    source = "../Day-7-module-source"
    ami-id = "ami-04f617474d20eae29"
    instance-type = "t3.micro"
}