## Create a bucket
```sh
aws s3 mb s3://bucket-policy-example-mt-21212121
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-mt-21212121 --policy file://policy.json
```
## In the other account
```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-mt-21212121
aws s3 ls s3://bucket-policy-example-mt-21212121
```
## Cleanup
aws rm s3://bucket-policy-example-mt-21212121/bootcamp.txt
aws rb s3://bucket-policy-example-mt-21212121