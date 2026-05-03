## Create a bucket
```bash
aws s3 mb s3://cors-fun-mt-232345
```
## Change block public acess
```bash
aws s3api put-public-access-block \
    --bucket cors-fun-mt-232345 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```bash
aws s3api put-bucket-policy --bucket cors-fun-mt-232345 --policy file://bucket-policy.json
```
## Turn on static website hosting
```bash
aws s3api put-bucket-website --bucket cors-fun-mt-232345 --website-configuration file://website.json

```

## Upload our index.htmlk file and include a resource that would be cross-origin
```bash
aws s3 cp index.html s3://cors-fun-mt-232345
```
## View the website dn see if the index.html is there
```bash
It is for us-east-1
http://cors-fun-mt-232345.s3-website.us-east-1.amazonaws.com
aws s3api get-bucket-website --bucket cors-fun-mt-232345
```

## Create Website 2

```bash
aws s3 mb s3://cors-fun-mt2-232345
```

## Change block public acess
```bash
aws s3api put-public-access-block \
    --bucket cors-fun-mt2-232345 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```bash
aws s3api put-bucket-policy --bucket cors-fun-mt2-232345 --policy file://bucket-policy2.json
```
## Turn on static website hosting
```bash
aws s3api put-bucket-website --bucket cors-fun-mt2-232345 --website-configuration file://website.json

```

## Upload our java script fileindex.htmlk file and include a resource that would be cross-origin
```bash
aws s3 cp hello.js s3://cors-fun-mt2-232345
aws s3 cp index.html s3://cors-fun-mt-232345
```
## Create API gATEWAY WITH MOCK RESPONSE AN THEN TEST THE ENDPOING

curl -X POST -H "Content-Type: application/json" https://ay5wlbw4ck.execute-api.us-east-1.amazonaws.com/proud/hello



## Set CORS our bucket
```bash
aws s3api put-bucket-cors --bucket cors-fun-mt-232345 --cors-configuration file://cors.json


