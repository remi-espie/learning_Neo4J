import org.apache.spark.sql.{SparkSession, Dataset}
import org.apache.spark.sql.functions._

object UserTest {
  def main(args: Array[String]): Unit = {
    val minioEndpoint = sys.env("MINIO_ENDPOINT")
    val minioAccessKey = sys.env("MINIO_ACCESS_KEY")
    val minioSecretKey = sys.env("MINIO_SECRET_KEY")
    val minioBucket = sys.env("MINIO_BUCKET")
    val minioFile = sys.env("MINIO_FILE")

    val spark = SparkSession.builder()
      .appName("UsersTest")
      .master("local[*]")
      .config("spark.hadoop.fs.s3a.endpoint", minioEndpoint)
      .config("spark.hadoop.fs.s3a.access.key", minioAccessKey)
      .config("spark.hadoop.fs.s3a.secret.key", minioSecretKey)
      .config("spark.hadoop.fs.s3a.path.style.access", "true")
      .getOrCreate()

    import spark.implicits._
    val usersDF = spark.read
      .option("header", "true")
      .option("inferSchema", "true")
      .csv(s"s3a://$minioBucket/$minioFile")

    val result = usersDF
      .filter($"age" >= 25)
      .groupBy("city")
      .agg(collect_list("name").as("names"))
      .select("city", "names")

    val resultCollected = result.collect()
    resultCollected.foreach { row =>
      val city = row.getAs[String]("city")
      val names = row.getAs[Seq[String]]("names")
      println(s"Users in $city: ${names.mkString(", ")}")
    }
    spark.stop()
  }
}