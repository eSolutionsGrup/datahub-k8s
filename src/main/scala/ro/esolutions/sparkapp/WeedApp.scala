package ro.esolutions.sparkapp

import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession

object WeedApp extends App {

  val jobName = this.getClass.getCanonicalName
  val conf = new SparkConf()
    .setAppName(jobName)
    .set("spark.eventLog.enabled", "false")
    .set("spark.hadoop.fs.seaweedfs.impl", "seaweed.hdfs.SeaweedFileSystem")
    .set("spark.hadoop.fs.defaultFS", "seaweedfs://localhost:9333")

//    .set("spark.hadoop.fs.s3a.endpoint", "http://localhost:8000")
//    .set("spark.hadoop.fs.s3a.access.key", "AKIAJFK6DNNS767MUYEQ")
//    .set("spark.hadoop.fs.s3a.secret.key", "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")
//    .set("spark.hadoop.fs.s3a.path.style.access", "true")
//    .set("spark.hadoop.fs.s3a.fast.upload", "true")
//    .set("spark.hadoop.fs.s3a.connection.ssl.enabled", "false")
//    .set("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")
//    .set("spark.hadoop.fs.defaultFS", "s3a://")

  val spark = SparkSession.builder()
    .master("local")
    .config(conf)
    .getOrCreate()

  spark.range(1,10)
    .write
    .mode("overwrite")
    .format("csv")
    .save("/buckets/demo/dummy")


}
