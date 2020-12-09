#output "aws_instance_url" {
output "Splunk_Enterprise" {
  value = "https://${aws_instance.splunk.public_dns}:8000"
}
