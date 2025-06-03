Write-Host "== Deploying SQS FIFO stack =="

$StackName = "sqs-fifo"
$TemplatePath = (Resolve-Path ".\template.yaml").Path

# Check if the stack already exists
  
  aws cloudformation deploy `
  --template-file ".\template.yaml" `
  --stack-name "sqs-fifo" `
  --capabilities CAPABILITY_NAMED_IAM `
  --region us-east-1

