resource "aws_instance" "main" {
count = 4
ami = var.ami_id
instance_type = var.environment == "dev" ? var.instance_type : "t3.small"
subnet_id = var.subnet_id
vpc_security_group_ids = [aws_security_group.allow_all.id ]
tags = {
    Name = var.instance[count.index]
}
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "Allow all inbound and outbound traffic"
    vpc_id = var.vpc_id
    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         =  var.protocol
        cidr_blocks      =  var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
}
