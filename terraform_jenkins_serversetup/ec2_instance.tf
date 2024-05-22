resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  tags = {
    Name = var.instance_name
  }

  key_name  = var.key_pair
  user_data = base64sha256("advance_user_data.sh")

  root_block_device {
    volume_size = 40  
  }  
}