resource "aws_instance" "main" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    tags = var.tags
  
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "Allow all inbound and outbound traffic"
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each = var.ingress_ports
        content {
        from_port        = ingress.value["from_port"]
        to_port          = ingress.value["to_port"]
        protocol         = var.protocol
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         =  var.protocol
        cidr_blocks      =  var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }



}