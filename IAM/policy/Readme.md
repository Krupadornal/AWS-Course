
# converting into the json

yq -o json policy.yml > policy.json


# the bash script 
 ./convert

 # Create IAM policy

 aws iam create-policy \
--policy-name my-User-policy \
--policy-document file://policy.json


# Attach Policy to user 

aws iam attach-user-policy \
--policy-arn arn:aws:iam::982383527471:policy/my-User-policy  \
--user-name devops-user