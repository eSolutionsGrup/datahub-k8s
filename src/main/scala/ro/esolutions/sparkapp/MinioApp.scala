package ro.esolutions.sparkapp

import org.apache.spark.SparkConf
import org.apache.spark.sql._

object MinioApp {
  def main(args: Array[String]) {

    val jobName = this.getClass.getCanonicalName
    val conf = new SparkConf().setAppName(jobName)
      .set("spark.hadoop.fs.s3a.endpoint", "http://minio.minio-tenant.svc.cluster.local")
//      .set("spark.hadoop.fs.s3a.endpoint", "http://localhost:9000")
      .set("spark.hadoop.fs.s3a.access.key", "minio")
      .set("spark.hadoop.fs.s3a.secret.key", "minio123")
      .set("spark.hadoop.fs.s3a.path.style.access", "true")
      .set("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
    val spark = SparkSession.builder().config(conf).getOrCreate()
    spark.sparkContext.setLogLevel("ERROR")

    val df = spark.read.csv("s3a://spark/input/orders.csv")

    println(df.show(10))

    df.write.mode(SaveMode.Overwrite).json("s3a://spark/output/")

  }
}
