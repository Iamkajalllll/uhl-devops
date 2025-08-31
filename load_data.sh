#!/bin/bash
# Script to validate vendor CSV and upload to AWS S3
CSV_FILE="sample_file.csv"
S3_BUCKET="s3://uhl-vendor-data"
# Step 1: Check if file exists
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: CSV file not found!"
    exit 1
fi
# Step 2: Row count validation
ROW_COUNT=$(wc -l < "$CSV_FILE")
if [ "$ROW_COUNT" -lt 1 ]; then
    echo "Error: CSV file is empty!"
    exit 1
fi
echo "Row count is: $ROW_COUNT"
# Step 3: Upload to S3
aws s3 cp "$CSV_FILE" "$S3_BUCKET"/sample_file.csv
if [ $? -ne 0 ]; then
    echo "Error: Upload to S3 failed!"
    exit 1
fi
echo "File uploaded successfully to $S3_BUCKET"
