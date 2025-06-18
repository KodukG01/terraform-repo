resource "aws_instance" "main" {
for_each = var.instance
ami = var.ami_id
instance_type = each.value
subnet_id = var.subnet_id
vpc_security_group_ids = [aws_security_group.allow_all.id ]
tags = {
    Name = each.key
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
