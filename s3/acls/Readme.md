## Create a bucket

```sh
aws s3api create-bucket --bucket acl-example-ab-232424 --region us-east-1
```
## Turn of Block Public Access for ACLs
```sh
aws s3api put-public-access-block \
    --bucket acl-example-ab-232424 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-example-ab-232424
```

## Change bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-ab-232424 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change 

```sh
aws s3api put-bucket-acl --bucket acl-example-ab-232424 \
--access-control-policy file://workspaces/Aws-examples/s3/acls/policy.json


aws s3api put-bucket-acl \
  --bucket acl-example-ab-232424 \
  --access-control-policy file://s3/acls/policy.json

```

## Acces bucket rom other account
```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://acl-example-ab-232424
aws s3 ls s3://acl-example-ab-232424

```

## Clean up
```sh
aws s3 rm s3://acl-example-ab-232424/bootcamp.txt
aws s3 rb s3://acl-example-ab-232424
```