##Create bucket
```sh
aws s3 mb s3://class-fun-ab224424

#create file

echo "Hello wordl">hello.txt
aws s3 cp hello.txt s3://class-fun-ab224424 --storage-class STANDARD_IA 
