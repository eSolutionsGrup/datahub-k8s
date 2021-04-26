package ro.esolutions.sparkapp

import org.apache.spark.sql.{SaveMode, SparkSession}
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

object OrdersApp extends App {

  println(s"args: ${args.mkString}")

//  if (args.length < 2) {
//    System.err.println(s"Usage: OrdersApp ${args.length}")
//    System.exit(1)
//  }

  val jobName = this.getClass.getCanonicalName
  val conf = new SparkConf().setAppName(jobName)
  val spark = SparkSession.builder().config(conf).getOrCreate()
  spark.sparkContext.setLogLevel("ERROR")

  val df = spark.read.csv("/datashare/datasets/orders.csv")
  df.write
    .mode(SaveMode.Overwrite)
    .csv("/tmp/orders/")

  df.show(10)

  println(s"saved ${df.count()} rows")

}
