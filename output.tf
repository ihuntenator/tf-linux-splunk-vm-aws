output "Splunk_Enterprise" {
  description = "The Splunk Enterprise web UI URL"
  value = "https://${aws_instance.splunk.public_dns}:8000"
}
