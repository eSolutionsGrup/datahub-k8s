FROM base-spark:3.1.2

USER root

ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.0/hadoop-aws-3.2.0.jar $SPARK_HOME/jars
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.375/aws-java-sdk-bundle-1.11.375.jar $SPARK_HOME/jars

USER ${spark_uid}

ENV SPARK_NO_DAEMONIZE TRUE
EXPOSE 18080/tcp

ENTRYPOINT ["/opt/spark/sbin/start-history-server.sh"]