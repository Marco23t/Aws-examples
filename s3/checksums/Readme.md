#Create a NEW S3 bucket

```md
aws s3 mb s3://checksums-examples-ab-2322211
```

#Create a File that we will we do a checksum on
```md
echo "Hello Mars" > myfile.txt
```

#Get a checksum of a file for md5
```md
echo "Hello Mars" > myfile.txt
#8ed2d86f12620cdba4c976ff6651637f  myfile.txt
```

##upload our s3 file and look at its etag

```
aws s3 cp myfile.txt s3://checksums-examples-ab-2322211
aws s3api head-object --bucket checksums-examples-ab-2322211 --key myfile.txt
```

#Lets upload a file with  different kind of checksum
```
sudo apt install rhash -y
rhash --crc32 --simple myfile.txt
bundle exec ruby crc.rb
```


```sh

aws s3api put-object \
  --bucket "checksums-examples-ab-2322211" \
  --key "myfilecrc32.txt" \
  --body "myfile.txt" \
  --checksum-algorithm CRC32 \
  --checksum-crc32 "58gLhw=="
```