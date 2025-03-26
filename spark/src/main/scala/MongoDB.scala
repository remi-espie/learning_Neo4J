import org.apache.spark.sql.{SaveMode, SparkSession}

object MongoDB {
  def main(args: Array[String]): Unit = {

    // Replace with the actual connection URI and credentials
    val username = "root"
    val password = "root"
    val database = "database"
    val collection = "collection"
    val uri = s"mongodb://$username:$password@localhost:27017/$database?authSource=admin"

    val spark = SparkSession.builder
      .appName("MongoDB")
      .master("local[*]")
      .config("spark.mongodb.read.connection.uri", s"$uri")
      .config("spark.mongodb.write.connection.uri", s"$uri")
      .getOrCreate()

    spark.sparkContext.setLogLevel("ERROR")

    val df = spark.read
      .format("mongodb")
      .option("collection", collection)
      .load()

    df.show()
  }
}
