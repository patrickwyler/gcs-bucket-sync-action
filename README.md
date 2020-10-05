# GCS Bucket Sync Action
Sync a Github repository with a Google Cloud Storage bucket.

## Inputs
- `secrets` Your Google service account credentials as json. _**(Required)**_
- `bucket` Name of the target bucket. _**(Required)**_
- `exclude` Regex for excluding files/dirs. ([gsutil rsync doc](https://cloud.google.com/storage/docs/gsutil/commands/rsync))

## Example

```
- name: Sync bucket
  uses: patrickwyler/gcs-bucket-sync-action@main
  with:
    secrets: ${{ secrets.google_service_account_credentials }}
    bucket: 'bucket_name'
    exclude: '.*\.md$|.git$|.github$|.gitignore$'
```
