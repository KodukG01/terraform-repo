resource "aws_security_group" "allow_all" {
    name        = "allow_all_dev"
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
  tags = {
    name = "allow_all_dev"
  }
    provider = aws.dev
}


resource "aws_security_group" "allow_all" {
    name        = "allow_all_prod"
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
  tags = {
    name = "allow_all_prod"
  }
    provider = aws.prod
}
