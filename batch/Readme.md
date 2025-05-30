# Build Image
Docker build -t app .
# Register job

aws batch register-job-definition
--job-definition-name square-job
--type container
--container-properties '{ "image": 112611828987.dkr.ecr.us-east-1.amazonaws.com/square:latest }'

#  create compute Env

aws batch create-compute-environment --compute-environment-name my-compute-env
--type MANAGED
--compute-resources minvCpus=0,desiredvCpus=1,maxvCpus=1,instanceTypes=m4.16xlarge,subnets=subnet-12345678,securityGroupIds=sg-12345678
--service-role arn:aws:iam::123456789012:role/service-role/AWSBatchServiceRole


#  create Queue

aws batch create-job-queue
--job-queue-name my-job-queue
--state ENABLED
--priority 1
--compute-environment-order '[ { "order": 1, "computeEnvironment": "arn:aws:batch:ca-central-1:982383527471:compute-environment/ComputeEnv" } ]'


# submit job 


aws batch submit-job
--job-name my-job
--job-definition square-job
--job-queue my-job-queue