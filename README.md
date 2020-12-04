# Terraform deploy for AWS linux instance with splunk

Create a AWS instance with splunk enterprise and octopus tentacle.

## the tfvars file

Have a tfvars file per environment to give access to AWS environment and ssh key for vm.

### dev.tfvars

```
access_key = "ACCESS_KEY"
secret_key = "SECRET_KEY"
keyName = "keyname"
keyPath = "/path/to/key"
```

## terraform run
```
terraform init
terraform validate
terraform plan -var-file=dev.tfvars -out tf-linux-splunk-vm-aws.out
terraform apply "tf-linux-splunk-vm-aws.out"
```

When finished:
```
terraform destroy -var-file=dev.tfvars
```
