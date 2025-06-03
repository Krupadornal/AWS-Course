Write-Host "== Sending messages =="

# Get current directory (like realpath . in Bash)
$RootPath = Get-Location

# Define SQS FIFO queue URL
$QueueUrl = "https://sqs.us-east-1.amazonaws.com/123456789012/my-fifo-queue.fifo"

# Define message attributes (optional, only include if needed)
# You must point to a file like: file://attributes.json
# Example file content:
# {
#   "AttributeName": {
#     "DataType": "String",
#     "StringValue": "Example"
#   }
# }
$messageAttributesPath = "file://message-attributes.json"

# Send messages
aws sqs send-message `
  --queue-url $QueueUrl `
  --message-body "Hello 1!" `
  --message-deduplication-id "1" `
  --message-group-id "hello" `
  --message-attributes $messageAttributesPath

aws sqs send-message `
  --queue-url $QueueUrl `
  --message-body "Hello 2!" `
  --message-deduplication-id "2" `
  --message-group-id "hello" `
  --message-attributes $messageAttributesPath

aws sqs send-message `
  --queue-url $QueueUrl `
  --message-body "Hello 3!" `
  --message-deduplication-id "3" `
  --message-group-id "hello" `
  --message-attributes $messageAttributesPath

aws sqs send-message `
  --queue-url $QueueUrl `
  --message-body "Hello 4!" `
  --message-deduplication-id "4" `
  --message-group-id "hello" `
  --message-attributes $messageAttributesPath

aws sqs send-message `
  --queue-url $QueueUrl `
  --message-body "Hello 5!" `
  --message-deduplication-id "5" `
  --message-group-id "hello" `
  --message-attributes $messageAttributesPath
