# create new bucket
```sh
aws s3api create-bucket --bucket acl-example-ak-2025 --region us-east-1

aws s3api put-public-access-block \
--bucket acl-example-ak-2025 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

aws s3api get-public-access-block --bucket acl-example-ak-2025

#Change Bucket Ownership
aws s3api put-bucket-ownership-controls \
--bucket acl-example-ak-2025 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

'''