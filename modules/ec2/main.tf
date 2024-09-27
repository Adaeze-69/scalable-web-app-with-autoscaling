resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count
  subnet_id     = var.subnet_id

  tags = {
    Name = "${var.instance_name}-instance"
  }
  user_data = <<-EOF
#!/bin/bash
echo "Hi! Adaeze here. I am learning more on terraform. Join me on this journey!" > index.html
nohup busybox httpd -f -p 8080 & 
EOF
user_data_replace_on_change = true
}

