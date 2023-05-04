#!/usr/bin/env bash

set -Ce

mkdir -p data

docker run -d --rm \
    -p 29999:29999 \
    -p 30000:30000 \
    --net=alluxio_network \
    --name=alluxio-worker \
    --shm-size=1G \
    -e ALLUXIO_JAVA_OPTS=" \
       -Dalluxio.worker.ramdisk.size=1G \
       -Dalluxio.master.embedded.journal.addresses=alluxio-master-1:19200,alluxio-master-2:19200,alluxio-master-3:19200 \
       -Dalluxio.master.nameservices.docker-alluxio-cluster=master1,master2,master3 \
       -Dalluxio.master.rpc.address.docker-alluxio-cluster.master1=alluxio-master-1:19998 \
       -Dalluxio.master.rpc.address.docker-alluxio-cluster.master2=alluxio-master-2:19998 \
       -Dalluxio.master.rpc.address.docker-alluxio-cluster.master3=alluxio-master-3:19998 \
       -Dalluxio.worker.hostname=alluxio-worker \
       -Dalluxio.master.security.impersonation.spark.users=*" \
    -v "/Users/${USER}/projects/alluxio-experiments/data":/opt/alluxio/underFSStorage \
    --mount type=bind,source="/Users/${USER}/projects/cloud/gcp/iam/alluxio-dev.json",target=/tmp/alluxio-dev.json,readonly \
    --mount type=bind,source="/Users/${USER}/projects/alluxio-experiments/alluxio_setup.sh",target=/tmp/alluxio_setup.sh,readonly \
    alluxio/alluxio worker --no-format