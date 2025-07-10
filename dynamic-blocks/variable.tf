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

variable "ingress_ports" {
    default = [
    {
        from_port = 22
        to_port   = 22
    },
    {
        from_port = 80
        to_port   = 80
    },
    {
        from_port = 443
        to_port   = 443
    }
    ]
}