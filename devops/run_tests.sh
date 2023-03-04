
# I AM EXPOSING THESE KEYS ON PURPOSE TO TEST THE, BUT THEY ARE STILL IN THE HISTORY IF YOU DON'T BELIEVE ME
export AWS_ACCESS_KEY_ID="<REMOVING-KEYS-TO-AVOID-EMAILS>"
export AWS_SECRET_ACCESS_KEY="<REMOVING-KEYS-TO-AVOID-EMAILS>"
export bucket_name="946419871611-exposed-keys-junior-devops"
export bucket_sync_to="s3://${bucket_name}/my-devops-stuff/"
export AWS_REGION="us-east-1"
buckets=$(aws s3api list-buckets --query "Buckets[].Name" --region ${AWS_REGION})

echo "bucket results: ${buckets}"

echo "uploading files to ${bucket_sync_to}"
aws s3 sync . "${bucket_sync_to}" --region ${AWS_REGION}

files=$(aws s3api list-objects --region ${AWS_REGION} --bucket "${bucket_name}")
echo $files

# optionally delete all the files
aws s3 rm "s3://${bucket_name}" --recursive