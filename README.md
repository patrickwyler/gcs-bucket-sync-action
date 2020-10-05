# GCS Bucket Sync Action
Sync a Github repository with a Google Cloud Storage bucket.

## Inputs
- `secrets` Your Google service account credentials as json. _**(Required)**_
- `bucket` Name of the target bucket. _**(Required)**_

## Example

```
- name: Sync
  uses: patrickwyler@main
  with:
    secrets: ${{ secrets.google_service_account_credentials }}
    bucket: 'bucket_name'
```
