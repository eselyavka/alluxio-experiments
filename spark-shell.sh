#!/usr/bin/env bash

set -Ce

docker run --rm -it \
  --name apache-spark \
  --net=alluxio_network \
  --mount type=bind,source="/Users/${USER}/projects/cloud/gcp/iam/alluxio-dev.json",target=/tmp/alluxio-dev.json,readonly \
  --mount type=bind,source="/Users/eseliavka/projects/terraform/alluxio/count.scala",target=/tmp/count.scala,readonly \
  my-spark-image:latest /opt/spark/bin/spark-shell \
    --conf spark.hadoop.fs.AbstractFileSystem.gs.impl=com.google.cloud.hadoop.fs.gcs.GoogleHadoopFS \
    --conf spark.hadoop.google.cloud.auth.service.account.enable=true \
    --conf spark.hadoop.google.cloud.auth.service.account.json.keyfile=/tmp/alluxio-dev.json \
    --conf "spark.executor.extraJavaOptions=-Dalluxio.security.login.impersonation.username=_HDFS_USER_ \
                                            -Dalluxio.master.nameservices.docker-alluxio-cluster=master1,master2,master3 \
                                            -Dalluxio.master.rpc.address.docker-alluxio-cluster.master1=alluxio-master-1:19998 \
                                            -Dalluxio.master.rpc.address.docker-alluxio-cluster.master2=alluxio-master-2:19998 \
                                            -Dalluxio.master.rpc.address.docker-alluxio-cluster.master3=alluxio-master-3:19998" \
    --conf "spark.driver.extraJavaOptions=-Dalluxio.security.login.impersonation.username=_HDFS_USER_ \
                                          -Dalluxio.master.nameservices.docker-alluxio-cluster=master1,master2,master3 \
                                          -Dalluxio.master.rpc.address.docker-alluxio-cluster.master1=alluxio-master-1:19998 \
                                          -Dalluxio.master.rpc.address.docker-alluxio-cluster.master2=alluxio-master-2:19998 \
                                          -Dalluxio.master.rpc.address.docker-alluxio-cluster.master3=alluxio-master-3:19998"
