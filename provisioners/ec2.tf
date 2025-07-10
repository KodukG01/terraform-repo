resource "aws_instance" "main" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    tags = var.tags

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > inventory"
        on_failure = continue
      
    }
    provisioner "local-exec" {
        command = "echo when instance is destroyed, delete the inventory file"
        when = destroy

    }
    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
    ]
    
    }
    provisioner "remote-exec" {
        when = destroy
        inline = [ 
            "sudo dnf stop nginx",
            
         ]

    }
      
    }

resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "Allow all inbound and outbound traffic"
    vpc_id = var.vpc_id
    ingress {
        from_port        = var.from_port
        to_port          = var.from_port
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