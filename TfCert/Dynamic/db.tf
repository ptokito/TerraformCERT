provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "MydbEC2" {
    ami = "ami-0947d2ba12ee1ff75"
    security_groups = [aws_security_group.web_traffic.name]
    instance_type = "t2.micro"

    tags = {
        name = "web server" 
    }

}

variable "ingress_rules" {
    type = list(number)
    default = [25,80,443,8080,8443]
}
variable "egress_rules" {
    type = list(number)
    default = [443,8443]
}

resource "aws_security_group" "web_traffic" { 
    name = "secure_server" 
    dynamic "ingress" { 
        iterator = port
        for_each = var.ingress_rules
        content { 
            from_port = port.value
            to_port = port.value
            protocol =  "TCP" 
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

        dynamic "egress" { 
        iterator = port
        for_each = var.egress_rules
        content { 
            from_port = port.value
            to_port = port.value
            protocol = "TCP" 
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}


