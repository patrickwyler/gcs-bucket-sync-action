# GCS Bucket Sync Action
This action helps by easily syncing a Github repository with a Google Cloud Storage bucket. It is very generic and can be used for different purposes. I used it for uploading my static website.

## Features
- [X] Sync files/directories from your repository to your bucket
- [X] Delete files/directories from your bucket which where removed in your repository
- [X] Exclude certain files from being synced with the bucket

## Requirements
- An existing empty* bucket
- A service account with access to the bucket
- The service account key _(json format)_

_\*If you want to sync to an exiting bucket, make sure that your repository includes the whole content of it, otherwise you could lose data!_

## Inputs
- `secrets` Your Google service account credentials as json. _**(Required)**_
- `bucket` Name of the target bucket. _**(Required)**_
- `sync_dir` Directory path to sync, relative to bucket, for example, `my_folder/to_sync`. It is empty by default.
- `exclude` Regex for excluding files/dirs. ([gsutil rsync doc](https://cloud.google.com/storage/docs/gsutil/commands/rsync))

## Example

```
name: Deploy

on:
  push:
    branches:
      - main

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Sync
        uses: patrickwyler/gcs-bucket-sync-action@1.3
        with:
          secrets: ${{ secrets.google_service_account_credentials }}
          bucket: 'patrickwyler.com'
          exclude: '.*\.md$|\.gitignore$|\.git/.*$|\.github/.*$'

```

## Diagram

![Diagram](http://www.plantuml.com/plantuml/png/TPB1JiCm38RlUGghNE3GmUWa149eOqoSk8mhbopnscXfKYMfs8JsxgInjcwZ71fPzcVd_-DEVU0kjBLcVgDCmnslmQ48t9GQuOS1hAoJwEPMMmVoeU2JnsFoC-mY9BclKB8zOqBRLaAfGjMkW7l8tbEOfJbhgsCBE6nigYrZu5MmRfV1rNUb0brt1ALoumIEui28hDTIuDq5KH11Lrv0IcCwY5akPcyVYr4j_w4cnqcgDDPXZoMkVnEFEiRAcjG0PEvSrNqggPgNw3EgzXUDgMWaRaTLgFKVWBhHEUjEW3thldW8MpVMe0d0IKR_q31B6P9U5ASx4GrnrdOUvbtoR2shLcmm9EOrXSDB8Mp88kcd-f3D0MZOwhvJpVfNVixpWzCdo4eCQOY_ZI8yV9bhXxw9AE1Mw5PYJ47wZMzYb37gX3n_ELYCGoBYTqOaO8f6jhN-1G00)

### Tags
GCP, Google Cloud Platform, GCS, Google Cloud Storage, Bucket, Sync, Syncing, Uploading, Upload
