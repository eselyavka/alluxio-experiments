#!/usr/bin/env bash

set -Ce

docker run -d --rm \
    -p 19997:19999 \
    --net=alluxio_network \
    --name=alluxio-master-1 \
    -e ALLUXIO_JAVA_OPTS=" \
        -Dalluxio.master.mount.table.root.ufs=/opt/alluxio/underFSStorage \
        -Dalluxio.master.hostname=alluxio-master-1 \
        -Dalluxio.master.journal.type=EMBEDDED \
        -Dalluxio.master.backup.directory=/opt/alluxio/metadata_backups \
        -Dalluxio.master.embedded.journal.addresses=alluxio-master-1:19200,alluxio-master-2:19200,alluxio-master-3:19200 \
        -Dalluxio.master.nameservices.docker-alluxio-cluster=master1,master2,master3 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master1=alluxio-master-1:19998 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master2=alluxio-master-2:19998 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master3=alluxio-master-3:19998 \
        -Dalluxio.master.security.impersonation.spark.users=*" \
    -v "/Users/${USER}/projects/terraform/alluxio/data":/opt/alluxio/underFSStorage \
    -v "/Users/${USER}/projects/terraform/alluxio/journal1":/opt/alluxio/journal \
    --mount type=bind,source="/Users/${USER}/projects/cloud/gcp/iam/alluxio-dev.json",target=/tmp/alluxio-dev.json,readonly \
    --mount type=bind,source="/Users/${USER}/projects/terraform/alluxio/alluxio_setup.sh",target=/tmp/alluxio_setup.sh,readonly \
    alluxio/alluxio master --no-format

docker run -d --rm \
    -p 19998:19999 \
    --net=alluxio_network \
    --name=alluxio-master-2 \
    -e ALLUXIO_JAVA_OPTS=" \
        -Dalluxio.master.mount.table.root.ufs=/opt/alluxio/underFSStorage \
        -Dalluxio.master.hostname=alluxio-master-2 \
        -Dalluxio.master.journal.type=EMBEDDED \
        -Dalluxio.master.backup.directory=/opt/alluxio/metadata_backups \
        -Dalluxio.master.embedded.journal.addresses=alluxio-master-1:19200,alluxio-master-2:19200,alluxio-master-3:19200 \
        -Dalluxio.master.nameservices.docker-alluxio-cluster=master1,master2,master3 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master1=alluxio-master-1:19998 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master2=alluxio-master-2:19998 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master3=alluxio-master-3:19998 \
        -Dalluxio.master.security.impersonation.spark.users=*" \
    -v "/Users/${USER}/projects/terraform/alluxio/data":/opt/alluxio/underFSStorage \
    -v "/Users/${USER}/projects/terraform/alluxio/journal2":/opt/alluxio/journal \
    --mount type=bind,source="/Users/${USER}/projects/cloud/gcp/iam/alluxio-dev.json",target=/tmp/alluxio-dev.json,readonly \
    --mount type=bind,source="/Users/${USER}/projects/terraform/alluxio/alluxio_setup.sh",target=/tmp/alluxio_setup.sh,readonly \
    alluxio/alluxio master --no-format

docker run -d --rm \
    -p 19999:19999 \
    --net=alluxio_network \
    --name=alluxio-master-3 \
    -e ALLUXIO_JAVA_OPTS=" \
        -Dalluxio.master.mount.table.root.ufs=/opt/alluxio/underFSStorage \
        -Dalluxio.master.hostname=alluxio-master-3 \
        -Dalluxio.master.journal.type=EMBEDDED \
        -Dalluxio.master.backup.directory=/opt/alluxio/metadata_backups \
        -Dalluxio.master.embedded.journal.addresses=alluxio-master-1:19200,alluxio-master-2:19200,alluxio-master-3:19200 \
        -Dalluxio.master.nameservices.docker-alluxio-cluster=master1,master2,master3 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master1=alluxio-master-1:19998 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master2=alluxio-master-2:19998 \
        -Dalluxio.master.rpc.address.docker-alluxio-cluster.master3=alluxio-master-3:19998 \
        -Dalluxio.master.security.impersonation.spark.users=*" \
    -v "/Users/${USER}/projects/terraform/alluxio/data":/opt/alluxio/underFSStorage \
    -v "/Users/${USER}/projects/terraform/alluxio/journal3":/opt/alluxio/journal \
    --mount type=bind,source="/Users/${USER}/projects/cloud/gcp/iam/alluxio-dev.json",target=/tmp/alluxio-dev.json,readonly \
    --mount type=bind,source="/Users/${USER}/projects/terraform/alluxio/alluxio_setup.sh",target=/tmp/alluxio_setup.sh,readonly \
    alluxio/alluxio master --no-format