# Fetch latest Ubuntu 22.04 AMI dynamically
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical owner ID for official Ubuntu AMIs
}

# Server 1: Jenkins & DevOps Management Node
resource "aws_instance" "jenkins_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.medium" # t2.medium handles Jenkins, Docker builds, and monitoring smoothly
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.platform_sg.id]
  key_name               = "your-aws-key-name" # REPLACE with your actual AWS EC2 Key Pair name

  tags = {
    Name = "jenkins-ci-cd-node"
  }
}

# Server 2: Production Application Server
resource "aws_instance" "prod_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro" # t2.micro is lightweight and perfect for running just Nginx and your App container
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.platform_sg.id]
  key_name               = "your-aws-key-name" # REPLACE with your actual AWS EC2 Key Pair name

  tags = {
    Name = "production-app-node"
  }
}
