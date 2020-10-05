# GCS Bucket Sync Action
Sync a Github repository with a Google Cloud Storage bucket.

## Inputs
- `secrets` Your Google service account credentials as json. _**(Required)**_
- `bucket` Name of the target bucket. _**(Required)**_
- `exclude` List of excluded files/dirs.

## Example

```
- name: Sync bucket
  uses: patrickwyler/gcs-bucket-sync-action@main
  with:
    secrets: ${{ secrets.google_service_account_credentials }}
    bucket: 'patrickwyler.com'
    exclude: |
      |
      .git
      .github
      .gitignore
      *.md
```
