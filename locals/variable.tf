variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
    type = string
}

variable "instance_type" {
    default = "t3.micro"
    type = string
} 

variable "subnet_id" {
    default = "subnet-081664e4edc3280ae"
    type = string
}

variable "tags" {
    default = {
        Name = "MyEC2Instance"
        purpose = "variable_example"
    }
}

variable "vpc_id" {
    default = "vpc-0abc2b32312e6b6da"
    type = string
  
}

variable "from_port" {
    default = 0
    type = number
  
}

variable "instance" {
    default = {
        mongodb = "t3.micro"
        redis = "t3.micro"
        mysql = "t3.small"
        rabbitmq = "t3.micro"
        
    }
  
}

variable "to_port" {
    default = 0
    type = number
}

variable "protocol" {
    default = "-1"
    type = string
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
    type = list(string)
}

variable "environment" {
    default = "prod"
}

variable "zone_id" {
    default = "Z0252688T5XCJOJGZQAF"
    type = string
}

variable "domain_name" {
    default = "devsecops.fun"
    type = string
  
}

variable "component" {
    default = "cart"
}

variable "project" {
    default = "roboshop"
}



variable "common_tags" {
    default = {
        default = {
            Project = "roboshop"
            Terraform = "true"
        }
    }
}