data "aws_caller_identity" "current" {}

data "aws_ami" "ec2_instance" {
    most_recent = true

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    owners = ["${data.aws_caller_identity.current.account_id}"]
}

resource "aws_instance" "dave-ec2" {
    ami = data.aws_ami.ec2_instance.id
    instance_type = "t2.micro"

    tags = {
      "Name" = "dave-test-instance"
    }
  
}