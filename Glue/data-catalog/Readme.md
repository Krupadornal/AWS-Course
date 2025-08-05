# S3 Bucket

aws s3 mb s3://glue-data-catalog-2025

# Download Data File

We can get data from here:

https://catalog.data.gov/dataset/electric-vehicle-population-data

```sh
curl https://data.transportation.gov/api/views/keg4-3bc2/rows.csv?accessType=DOWNLOAD -o trans.csv
```

# Upload data to S3 bucket

```sh
aws s3 cp data-catalog/trans.csv s3://glue-data-catalog-2025/data-catalog/trans.csv
```

# AWS Glue Database

```sh
aws glue create-database --database-input Name=Gluedatabase
```

# Create Glue Crawler



```sh
aws glue create-crawler \
--name MyCrawlerBasic \
--role MyGlueServiceRole \
--database-name Gluedatabase \
--targets '{"S3Targets": [{"Path": "s3://glue-data-catalog-2025/data-catalog/"}]}' \
--classifiers []
```