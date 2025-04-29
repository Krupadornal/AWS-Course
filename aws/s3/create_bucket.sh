#!/bin/bash

create_bucket() {
    read -p "Enter bucket name (lowercase/dashes only): " dornald-bucket
    aws s3api create-bucket --bucket "dornald-bucket" --region us-east-1
    echo "Bucket 'dornald-bucket' created successfully!"
}

create_bucket
