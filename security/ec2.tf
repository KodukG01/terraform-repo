resource "aws_instance" "linux" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0b63e6b5c62c2af12"]
    subnet_id = "subnet-081664e4edc3280ae"

    tags = {
        Name = "LinuxInstance"
    }
  
}

resource "aws_security_group" "allow_all" {
    name = "allow_all_dev"
    description = "Allow all inbound traffic"
    vpc_id = "vpc-0abc2b32312e6b6da"

    ingress  {
        
            from_port   = 0
            to_port     = 0
            protocol    = "-1" # -1 means all protocols
            cidr_blocks = ["0.0.0.0/0"] # Allow all IPs
            ipv6_cidr_blocks = ["::/0"] # Allow all IPv6 addresses
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # -1 means all protocols
        cidr_blocks = ["0.0.0./0"] # Allow all IPs
        ipv6_cidr_blocks = ["::/0"] # Allow all IPv6 addresses
}


lifecycle {
    create_before_destroy = true
}

tags = {
  name = "allow_all_dev"
}

}