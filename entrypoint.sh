#!/bin/bash

# Restart ssh service
service ssh restart

# Format hadoop namenode
$HADOOP_HOME/bin/hdfs namenode -format

# Start file system
$HADOOP_HOME/sbin/start-dfs.sh

# Start yarn
$HADOOP_HOME/sbin/start-yarn.sh

# Start hbase
$HBASE_HOME/bin/start-hbase.sh

/bin/bash
