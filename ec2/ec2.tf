resource "aws_instance" "main" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    tags = {
        Name = "MyEC2Instance"
    }
    subnet_id = "subnet-081664e4edc3280ae"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
  
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "Allow all inbound and outbound traffic"
    vpc_id = "vpc-0abc2b32312e6b6da"
    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

