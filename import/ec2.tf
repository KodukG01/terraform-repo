resource "aws_instance" "linux" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0b63e6b5c62c2af12"]
    subnet_id = "subnet-081664e4edc3280ae"

    tags = {
        Name = "LinuxInstance"
    }
  
}