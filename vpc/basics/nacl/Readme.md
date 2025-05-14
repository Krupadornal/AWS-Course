## get VPC ID

```sh

aws ec2 describe-vpcs \
--filers "Name = tag:Name, Values=nal-example-vpc"\
--query "Vpcs.VpcId" \
-- output text\
```

## create the nacl

aws ec2 create-network-acl --vpc-id vpc-011c82b21af90092e

# get ami for the amazon linux 2

Amazon Linux 2023 AMI 2023.7.20250428.1 x86_64 HVM kernel-6.1

aws ec2 describe-images \
  --region us-east-1 \
  --owners amazon \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
  --query 'Images | sort_by(@, &CreationDate) | [-1].ImageId' \
  --output text


## i got this image got created here ~ $ aws ec2 describe-images \
```sh
>   --region us-east-1 \
>   --owners amazon \
>   --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
>   --query 'Images | sort_by(@, &CreationDate) | [-1].ImageId' \
>   --output text
ami-097947612b141c026
```






