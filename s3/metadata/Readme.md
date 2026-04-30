#create a bucket
```sh
aws s3 mb s3://metadata-fun-ab-12231
```
#create a new file
```sh
echo "Hello Mars!">hello.txt


#Upload file
aws s3api put-object --bucket metadata-fun-ab-12231 --key hello.txt --body hello.txt --metadata Planet=Mars

##Get object
aws s3api head-object --bucket metadata-fun-ab-12231 --key hello.txt

##cleanup
aws s3 rm s3://metadata-fun-ab-12231/hello.txt
aws s3 rb s3://metadata-fun-ab-12231

