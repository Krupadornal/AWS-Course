Write-Host "== Receiving messages =="

# Get the current directory (similar to realpath .)
$RootPath = Get-Location

# Define the SQS FIFO queue URL
$QueueUrl = "https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks?filteringText=&filteringStatus=active&viewNested=true"

# Call the AWS CLI to receive messages
aws sqs receive-message `
  --queue-url $QueueUrl `
  --attribute-names All `
  --message-attribute-names All `
  --max-number-of-messages 10
