resource "aws_instance" "splunk" {
  ami                    = lookup(var.amis, var.region)
  subnet_id              = var.subnet
  key_name               = var.keyName
  instance_type          = var.instanceType
  vpc_security_group_ids = [aws_security_group.splunk_enterprise.id]

  tags = {
    Name = var.instanceName
  }
  volume_tags = {
    Name = var.instanceName
  }

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file(var.keyPath)
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "~/projects/terraform/tf-linux-splunk-vm-aws/installSplunk.sh"
    destination = "/tmp/installSplunk.sh"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installSplunk.sh",
      "sudo /tmp/installSplunk.sh",
    ]
  }
}
