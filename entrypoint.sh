#!/bin/sh
# Auth
echo "$INPUT_SECRETS" > /secrets.json
gcloud auth activate-service-account --key-file=/secrets.json

# Set project id
PROJECT_ID=$(grep -o '"project_id": "[^"]*' /secrets.json | grep -o '[^"]*$')
rm /secrets.json

# Find bucket
BUCKET=$(gsutil ls -p $PROJECT_ID | grep "gs://.*$INPUT_BUCKET/$")

# Sync files to bucket
echo "Syncing bucket $BUCKET ..."
gsutil -m rsync -r -c -d /github/workspace $BUCKET
echo "Done."