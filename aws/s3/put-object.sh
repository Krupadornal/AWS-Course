#!/bin/bash

#!/bin/bash

echo "== Sync =="

set -e  # Exit on error

# Check if bucket name is provided
if [ -z "$1" ]; then 
    echo "Usage: ./put-object.sh <bucket-name> <filename>"
    exit 1
fi

# Check if file path is provided
if [ -z "$2" ]; then 
    echo "Usage: ./put-object.sh <bucket-name> <filename>"
    exit 1
fi

BUCKET_NAME=$1
FILENAME=$2
OBJECT_KEY=$(basename "$FILENAME")

# Upload the file to S3
aws s3api put-object \
  --bucket "$BUCKET_NAME" \
  --body "$FILENAME" \
  --key "$OBJECT_KEY"

echo " '$FILENAME' uploaded to bucket '$BUCKET_NAME' as object '$OBJECT_KEY'"


