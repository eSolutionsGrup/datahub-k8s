package ro.esolutions.sparkapp

import org.apache.spark.SparkConf
import org.apache.spark.sql._

/**
 *
- spark.sql.extensions = io.delta.sql.DeltaSparkSessionExtension
- spark.sql.catalog.spark_catalog = org.apache.spark.sql.delta.catalog.DeltaCatalog
- spark.jars = https://repo1.maven.org/maven2/io/delta/delta-core_2.12/1.0.0/delta-core_2.12-1.0.0.jar,https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.0.0/hadoop-aws-3.0.0.jar,https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.11.257/aws-java-sdk-1.11.257.jar
- spark.hadoop.fs.s3a.endpoint = https://minio.minio-storage.svc.cluster.local
- spark.hadoop.fs.s3a.connection.ssl.enabled = false
- spark.hadoop.fs.s3a.access.key = minio
- spark.hadoop.fs.s3a.secret.key = minio123
- spark.hadoop.fs.s3a.path.style.access = true
- spark.hadoop.fs.s3a.impl = org.apache.hadoop.spark.hadoop.fs.s3a.S3AFileSystem
- spark.hadoop.fs.defaultFS = s3a://deltalake
 *
 */

object MinioApp {
  def main(args: Array[String]) {

    val jobName = this.getClass.getCanonicalName
    val conf = new SparkConf()
      .setAppName(jobName)
//      .set("spark.hadoop.fs.s3a.endpoint", "http://minio.minio-tenant.svc.cluster.local")
      .set("spark.hadoop.fs.s3a.endpoint", "https://localhost:9000")
      .set("spark.hadoop.fs.s3a.access.key", "minio")
      .set("spark.hadoop.fs.s3a.secret.key", "minio123")
      .set("spark.hadoop.fs.s3a.path.style.access", "true")
      .set("spark.hadoop.fs.s3a.fast.upload", "true")
      .set("spark.hadoop.fs.s3a.connection.ssl.enabled", "false")
      .set("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
      .set("spark.hadoop.fs.defaultFS", "s3a://test")

    val spark = SparkSession.builder()
      .master("local")
      .config(conf)
      .getOrCreate()
//    spark.sparkContext.setLogLevel("ERROR")


    println("-" * 30)


    spark.range(1,10)
      .write
      .mode("overwrite")
      .format("csv")
      .save("/demo/main/dummy")

//    println(spark.sessionState.conf.getAllConfs)

//    spark.sessionState.conf.getAllConfs.foreach(case (k, v) => {println(s"$k -> $v")})

    println("-" * 30)

//    val df = spark.read.csv("/input/orders.csv")
//
//    println(df.show(10))
//
//    df.write.mode(SaveMode.Overwrite).json("/output/")

  }
}
