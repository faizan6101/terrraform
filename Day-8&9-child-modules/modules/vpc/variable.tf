variable "cidr-block" {
    description = "CIDR block for the VPC"
    type = string
    default = ""
  
}

variable "subnet-cidr" {
    description = "CIDR block for the subnet"
    type = string
    default = ""
  

}
variable "availability-zone" {
    description = "Availability zone for the subnet"
    type = string
    default = ""
  
}