from datetime import timedelta

from airflow import DAG

from airflow.providers.cncf.kubernetes.operators.spark_kubernetes import SparkKubernetesOperator
from airflow.providers.cncf.kubernetes.sensors.spark_kubernetes import SparkKubernetesSensor
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'max_active_runs': 1,
}

dag = DAG(
    'minio_spark',
    default_args=default_args,
    description='submit minio-app as sparkApplication on kubernetes',
    schedule_interval=timedelta(days=1),
    start_date=days_ago(1),
)

t1 = SparkKubernetesOperator(
    task_id='submit-minioapp',
    namespace="spark-apps",
    application_file="minio-app.yaml",
    kubernetes_conn_id="kubernetes_default",
    do_xcom_push=True,
    dag=dag,
)

t2 = SparkKubernetesSensor(
    task_id='monitor_minioapp',
    namespace="spark-apps",
    application_name="{{ task_instance.xcom_pull(task_ids='submit-minioapp')['metadata']['name'] }}",
    kubernetes_conn_id="kubernetes_default",
    dag=dag,
)

t3 = BashOperator(
    task_id="end_minioapp",
    bash_command="echo END",
    dag=dag
)

t1 >> t2 >> t3
