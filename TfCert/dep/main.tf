provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "MyEC2" {
    ami = "ami-0947d2ba12ee1ff75"
    instance_type = "t2.micro"

    tags = {
        name = "web server" 
    }

}

//depends_on = ["aws_instance.Myec2DB"]

resource "aws_instance" "Myec2DB" {
    ami = "ami-0947d2ba12ee1ff75"
    instance_type = "t2.micro"

    tags = {
        name = "db server" 
    }

}


