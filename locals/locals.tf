locals {
    sg_id = [aws_security_group.allow_all.id ]
    vpc_id = var.vpc_id
    subnet_id = var.subnet_id
    final_name = "${var.component}-${var.project}-${var.environment}"
    ec2_tags = merge(
        var.common_tags,
        {
            environment = var.environment
            
        }
    )
  
}