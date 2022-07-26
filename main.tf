resource "aws_instance" "web" {     #Creating EC2 instance
  ami           = var.ami_id        #Declare the variable
  instance_type = var.instance_type #Declare the variable
  tags = {
    "Name" = "web023"
  }

}

resource "aws_security_group" "ssh" { #Creating security group
  name   = "ssh_SG"
  vpc_id = var.vpc_id #Declare variable
  ingress {           #Inbound rules
    description = "SSH from VPC"
    from_port   = 80
    to_port     = 22
    protocol    = "ssh"
  }
  egress { #Outbound rules
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

#Define the variables
variable "ami_id" {

}

variable "instance_type" {

}

variable "vpc_id" {

}