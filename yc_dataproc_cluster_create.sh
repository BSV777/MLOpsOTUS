   yc dataproc cluster create HadoopSparkCluster \
   --zone=ru-central1-b \
   --service-account-name=hadoop-admin \
   --version=2.0 \
   --services=HDFS,SPARK,YARN \
   --ssh-public-keys-file=/home/dev/.ssh/yac_key.pub \
   --subcluster name="HadoopSparkMasterSubcluster",`
               `role=masternode,`
               `resource-preset=s3-c2-m8,`
               `disk-type=network-hdd,`
               `disk-size=25,`
               `subnet-name=default-ru-central1-b,`
               `assign-public-ip=true \
   --subcluster name="HadoopSparkDataSubcluster",`
               `hosts-count=3,`
               `role=datanode,`
               `resource-preset=s3-c2-m8,`
               `disk-type=network-hdd,`
               `disk-size=25,`
               `subnet-name=default-ru-central1-b \
   --security-group-ids=Идентификатор_of_hadoop-sec-grp \
   --ui-proxy=true