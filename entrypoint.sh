#!/bin/sh
# Auth
echo "$INPUT_SECRETS" > /secrets.json
gcloud auth activate-service-account --key-file=/secrets.json
rm /secrets.json

# Sync files to bucket
echo "Syncing bucket $BUCKET ..."
gcloud storage rsync /github/workspace/$INPUT_SYNC_DIR_FROM gs://$INPUT_BUCKET/$INPUT_SYNC_DIR_TO --recursive --checksums-only --delete-unmatched-destination-objects --cache-control="$INPUT_CACHE_CONTROL" --exclude="$INPUT_EXCLUDE" $INPUT_ADDTL_TAGS
if [ $? -ne 0 ]; then
    echo "Syncing failed"
    exit 1 
fi
echo "Done."
