resource "aws_instance" "web" {                                                     #Creating EC2 instance
  ami                    = var.ami_id                                               #Declare the variable
  instance_type          = var.instance_type                                        #Declare the variable
  vpc_security_group_ids = [aws_security_group.ssh.id, aws_security_group.http.id] #attached security group
  key_name               = ""
  tags = {
    "Name" = "web023"
  }

}

resource "aws_security_group" "ssh" { #Creating security group for ssh traffic
  name   = "ssh_SG"
  vpc_id = var.vpc_id #Declare variable
  ingress {           #Inbound rules
    description = "SSH from VPC"
    from_port   = 80
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { #Outbound rules
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow_ssh"
  }
}

resource "aws_security_group" "http" { #Creating security group for http traffic
  name   = "http_SG"
  vpc_id = var.vpc_id #Declare variable
  ingress {           #Inbound rules
    description = "SSH from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress { #Outbound rules
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
