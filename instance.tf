resource "aws_instance" "splunk" {
  ami             = lookup(var.amis, var.region) 
  subnet_id       = var.subnet 
  security_groups = var.securityGroups 
  key_name        = var.keyName 
  instance_type   = var.instanceType 
  
  tags = {
    Name = var.instanceName
  }
  volume_tags = {
    Name = var.instanceName
  }
  provisioner "file" {
    source      = "~/projects/terraform/tf-linux-splunk-vm-aws/installSplunk.sh"
    destination = "/tmp/installSplunk.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installSplunk.sh",
#      "sudo /tmp/installSplunk.sh",
    ]
  }
  
  connection {
    type        = "ssh"
    user        = "centos"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }
} 
