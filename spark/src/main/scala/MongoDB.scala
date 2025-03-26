import org.apache.spark.sql.{SaveMode, SparkSession}

object MongoDB {
  def main(args: Array[String]): Unit = {

    // Replace with the actual connection URI and credentials
    val uri = "mongodb://localhost:27017"
    val database = "database"
    val collection = "collection"

    val spark = SparkSession.builder
      .appName("MongoDB")
      .master("local[*]")
      .config("spark.mongodb.input.uri", s"$uri/$database.$collection")
      .config("spark.mongodb.output.uri", s"$uri/$database.$collection")
      .getOrCreate()

    spark.sparkContext.setLogLevel("ERROR")

    val df = spark.read
      .format("mongo")
      .load()

    df.show()
  }
}
