```sh
## Create a bucket
aws s3 mb s3://cors-test-ak-2025

## Change Block public access

aws s3api put-public-access-block \
--bucket cors-test-ak-2025 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

## Create a bucket policy 

aws s3api put-bucket-policy --bucket cors-test-ak-2025 --policy file://bucket-policy.json

## Turn on Staic website hosting 
aws s3api put-bucket-website --bucket cors-test-ak-2025 --website-configuration file://website.json

## Upload our index.html file and include a resource that would be cross-origin 

aws s3 cp index.html s3://cors-test-ak-2025

# to check the website ans see if the index.html is there or not.

http://cors-test-ak-2025.s3-website-us-east-1.amazonaws.com


# create website 2

aws s3 mb s3://cors-test2-kd-2025

# cahmnge block public access

aws s3api put-public-access-block \
--bucket cors-test2-kd-2025 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"

# bucket policy

aws s3api put-bucket-policy --bucket cors-test2-kd-2025 --policy file://bucketpolicy2.json

# staic website hosting 

aws s3api put-bucket-website --bucket cors-test2-kd-2025 --website-configuration file://website.json

#upload the js file 

aws s3 cp h.js s3://cors-test2-kd-2025

# create the api gateway with mock response and then rest the endpoint 

curl -X POST -H "Content-Type: application/json" https://0krq5vh8u8.execute-api.us-east-1.amazonaws.com/prod/h

## setting CORS on our bucket

aws s3api put-bucket-cors --bucket cors-test-ak-2025 --cors-configuration file://cors.json




```




