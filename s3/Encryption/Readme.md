## Create a bucket

aws s3 mb s3://encryption-fun-mt-3232323

## Create a file and put object with encruption SS3-S3
echo "Hello world">hello.txt
aws s3 cp hello.txt s3://encryption-fun-mt-3232323

6d70a40a-e7f8-41e8-973d-ffdc6c02b279
### Put object with encryption of  SS3-KMS
aws s3api put-object \
--bucket encryption-fun-mt-3232323 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id "6d70a40a-e7f8-41e8-973d-ffdc6c02b279"

## Put object with SSE-C
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE
aws s3api put-object \
--bucket encryption-fun-mt-3232323 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-md5 $MD5_VALUE

## Put object with SSE-C via aws s3

openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-fun-mt-3232323/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key