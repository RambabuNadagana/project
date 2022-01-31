provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "2ndproj" {
  depends_on = [aws_db_instance.default]
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"
  subnet_id   = "subnet-09521af8c6cfe39fb"
  key_name = "jenkins"
  user_data = templatefile("${path.module}/userdata.tftpl", {endpoint = aws_db_instance.default.endpoint,password = aws_db_instance.default.password})
  iam_instance_profile = "role_all"
  security_groups = ["sg-0bb5391635b3c304e"]
  tags = {
    Name = "cpms"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "cpms"
  identifier           = "myrdb"
  username             = "admin"
  password             = "Ramrebel56"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = ["sg-0f3745e327f461d64"]
}
