FROM datamechanics/spark:jvm-only-2.4.5-hadoop-3.1.0-java-8-scala-2.12-latest

ARG JAR_NAME
COPY target/${JAR_NAME}-jar-with-dependencies.jar /sparkapp.jar

ENTRYPOINT ["/opt/entrypoint.sh"]