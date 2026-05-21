## Create a user with no permissions

We need to create a new user with no permissions and generate out access keys

```sh
aws s3api create-bucket --bucket my-sts-fun-stack-mt-121212 --region us-east-1
aws iam create-user  --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table


```

Copy the access key and secret here

```sh
aws configure
```
Then edit credenctials file to change away from default profile

```sh
open ~/.aws/credentials 
notepad ~/.aws/credentials
```

Test who you are:
```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```
Make sure you dont ahve access to s3
```sh
aws s3 ls --profile sts
```
aws: [ERROR]: An error occurred (AccessDenied) when calling the ListBuckets operation: User: arn:aws:iam::021502749434:user/sts-machine-user is not authorized to perform: s3:ListAllMyBuckets because no identity-based policy allows the s3:ListAllMyBuckets action

### Create a role 
 We need to create a role that will access a new resource
 ```sh
chmod u+x bin/deploy
./bin/deploy

```
 ## Use new user credentials and assume role
  ```sh
 aws iam put-user-policy \
 --user-name sts-machine-user \
 --policy-name staAssumePolicy \
 --policy-document file://policy.json
  ```

 ```sh
 aws sts assume-role \
 --role-arn arn:aws:iam::021502749434:role/sts-demo-role \
 --role-session-name s3-sts-fun-342425 \
 --profile sts
  ```
### Cleanup
 ```sh
aws iam delete-user-policy --user-name sts-machine-user --policy-name staAssumePolicy
aws iam delete-access-key --access-key-id AKIAQKANJ5L5ACNJWSNX --user-name sts-machine-user
aws iam delete-user --user-name sts-machine-user
 ```