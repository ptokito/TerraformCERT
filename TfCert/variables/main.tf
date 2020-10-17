variable "vpcname" {
    type = string
    default = "myvpc" 
}
variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["value1", "value2"]
}

variable "mymap" {
    type = map 
    default = { 
        key1 = "value1"
        key2 = "value2"
    }
}
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    
}

output "vpcid" {
    value = aws_vpc.myvpc.id
}

