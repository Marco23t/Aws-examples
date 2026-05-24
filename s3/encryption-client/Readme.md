## Create a bucket

aws s3 mb s3://encrypt-client-fun-mt-34343

## Create a file

echo "Hello world">hello.txt

### Run our script SDK Ruby script

bundle exec ruby encrypt.rb

### Clean up
aws s3 rm s3://encrypt-client-fun-mt-34343/hello.txt
aws s3 rb s3://encrypt-client-fun-mt-34343