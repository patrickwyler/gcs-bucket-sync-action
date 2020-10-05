#!/bin/sh
# Auth
echo "$INPUT_SECRETS" > /secrets.json
gcloud auth activate-service-account --key-file=/secrets.json
rm /secrets.json

# Create list of excluded files/dirs
echo "$INPUT_EXCLUDE" > /list.txt

# Sync files to bucket
echo "Syncing bucket $BUCKET ..."
gsutil -m rsync -r -c -d --exclude-from={'list.txt'} /github/workspace gs://$INPUT_BUCKET/
echo "Done."