
# create buckets 

aws s3 mb  s3://source-datasync-5445

aws s3 mb s3://dest-datasync-5445


# upload file

touch sample.txt
aws s3 cp sample.txt s3://source-datasync-5445/data/sample.txt
