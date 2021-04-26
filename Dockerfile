FROM gcr.io/spark-operator/spark:v3.0.0

ARG JAR_NAME
COPY target/${JAR_NAME}-jar-with-dependencies.jar /sparkapp.jar

ENTRYPOINT ["/opt/entrypoint.sh"]