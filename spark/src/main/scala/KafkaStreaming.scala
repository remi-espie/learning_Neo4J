import org.apache.spark.sql.SparkSession

object KafkaStreaming {
  def main(args: Array[String]): Unit = {
    val kafkaEndpoint = sys.env("KAFKA_ENDPOINT")
    val kafkaTopic = sys.env("KAFKA_TOPIC")

    val spark = SparkSession.builder()
      .appName("KafkaStreaming")
      .master("local[*]")
      .getOrCreate()

    val usersDF = spark
      .readStream
      .format("kafka")
      .option("kafka.bootstrap.servers", s"$kafkaEndpoint")
      .option("subscribe", kafkaTopic)
      .option("includeHeaders", "true")
      .option("startingOffsets", "earliest")
      .load()

    val csvDF = usersDF
      .selectExpr("CAST(value AS STRING) as csv")
      .selectExpr("split(csv, '\n')[1] as csv")
      .selectExpr("split(csv, ',') as values")
      .selectExpr("values[0] as id", "values[1] as name", "values[2] as age")

    val query = csvDF.writeStream
      .outputMode("append")
      .format("console")
      .start()

    query.awaitTermination()
  }
}
