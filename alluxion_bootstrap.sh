#!/bin/bash

set -Ce

# Bootstrap GCS mounts
alluxio fs test -d /gcs || alluxio fs mkdir /gcs
alluxio fs mount --option fs.gcs.credential.path=/tmp/alluxio-dev.json /gcs/storage0 gs://de7b0cc731c0c821-alluxio-storage-0
alluxio fs mount --option fs.gcs.credential.path=/tmp/alluxio-dev.json /gcs/storage1 gs://de7b0cc731c0c821-alluxio-storage-1
alluxio fs mount --option fs.gcs.credential.path=/tmp/alluxio-dev.json /gcs/storage2 gs://de7b0cc731c0c821-alluxio-storage-2


# Set permissions to GCS mounts
for i in {0..2}; do
  # access file in GCS, in order to update cache
  alluxio fs ls "/gcs/storage${i}/data${i}/population/input.csv"

  alluxio fs setfacl -m "user:spark:r-x" "/gcs/storage${i}"
  alluxio fs setfacl -m "user:spark:r-x" "/gcs/storage${i}/data${i}"
  alluxio fs setfacl -m "user:spark:r-x" "/gcs/storage${i}/data${i}/population"
  alluxio fs setfacl -m "user:spark:r--" "/gcs/storage${i}/data${i}/population/input.csv"
done