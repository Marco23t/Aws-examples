## Get VPC ID
```sh
aws ec2 describe-vpcs --filters "Name-tag:Name,Values=nacl-example-vpc" --query "Vpcs.VpcId" --output text


```

## Create a nacl

```sh
aws ec2 create-network-acl --vpc-id vpc-02b157c7a55192519
```
## Add entry
```sh
aws ec2 create-network-acl-entry \
--network-acl-id acl-07c3da4d2d4015172 \
--ingress \
--rule-number 90 \
--protocol -1 \
--port-range From=0,To=65535 \
--cidr-block 174.5.108.3/32 \
--rule-action deny
```

## Get AMI for Amazon Linux 2
Amazon Linux 2023 AMI 2023.11.20260514.0 x86_64 HVM kernel-6.1

##Grab the latest AML2 AMI 
```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
--query "Images[?starts_with(Name, 'amzn2')]|sort_by(@, &CreationDate)[-1].ImageId" \
--region us-east-1 \
--output text

```
## Add etry


