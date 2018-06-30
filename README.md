# Docker-Hbase
This docker build setup is tested with `hbase-1.2.6.1`. If you wish to build an image with a differnt version of `Hbase`, change the value for `HBASE_VERSION` variable in the `deploy.conf` file.
  
### Build image:
 - Go into the root folder of this repository (where the `Makefile` exists).
 - For a normal build exeute: `make build`.
 - For a `no-cache` build execute: `make build-nc`. This means the intermediate images won't be saved in your local.
