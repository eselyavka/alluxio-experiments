val s = sc.textFile("alluxio://alluxio-master:19998/gcs/storage*/data*/population/input.csv")
s.count()
