# Terraform deploy for AWS linux instance with splunk

Create a AWS instance with splunk enterprise.

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
terraform plan -var-file=dev.tfvars -out tf.out
terraform apply "tf.out"
```

When finished:
```
terraform destroy -var-file=dev.tfvars
```

## Splunk Enterprise

Available at: http://<public-DNS-FQDN>:8000

Login as user admin

### Set to HTTPS

```
cp $SPLUNK_HOME/etc/system/default $SPLUNK_HOME/etc/system/local/default
```

Set as:
```
[settings]
httpport = 8000
enableSplunkWebSSL = true
```

Restart Splunk

## References

