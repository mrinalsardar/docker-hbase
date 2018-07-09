FROM mrinal449/docker-hadoop:1.0

# build time argument
ARG HBASE_VERSION

# update
RUN apt-get update

# install hbase
RUN curl --fail https://www.redrockdigimark.com/apachemirror/hbase/stable/hbase-${HBASE_VERSION}-bin.tar.gz > /opt/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar -xzf /opt/hbase-${HBASE_VERSION}-bin.tar.gz -C /opt/ && \
    rm /opt/hbase-${HBASE_VERSION}-bin.tar.gz && \
    ln -s /opt/hbase-${HBASE_VERSION} /opt/hbase && \
    sed -i -e \$a"export JAVA_HOME=$(echo ${JAVA_HOME})/" /opt/hbase/conf/hbase-env.sh && \
    mkdir /opt/hbase/data /opt/hbase/zookeeper

# configuration
COPY confs/hbase-site.xml /opt/hbase/conf/

# hbase home setup
ENV HBASE_HOME=/opt/hbase

# copy entrypoint script
COPY ./entrypoint.sh /

# add execute permission
RUN chmod +x /entrypoint.sh

# execute entrypoint script
ENTRYPOINT [ "/entrypoint.sh" ]

# command to execute while running the image
# to be overridden by any runtime command
CMD [ "/bin/bash" ]
