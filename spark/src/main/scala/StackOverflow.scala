import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.{IntegerType, StringType, StructType}

object StackOverflow {
  def main(args: Array[String]): Unit = {

    val spark = SparkSession.builder()
      .appName("StackOverflow")
      .master("local[*]")
      .getOrCreate()

    spark.sparkContext.setLogLevel("ERROR")

    import spark.implicits._

    val schema = new StructType()
      .add("postTypeId", IntegerType, nullable = true)
      .add("id", IntegerType, nullable = true)
      .add("acceptedAnswer", StringType, nullable = true)
      .add("parentId", IntegerType, nullable = true)
      .add("score", IntegerType, nullable = true)
      .add("tag", StringType, nullable = true)

    val df = spark.read
      .option("header", "false")
      .schema(schema)
      .csv("./stackoverflow.csv")

    println(s"\nCount of records in CSV file: ${df.count()}")
    df.printSchema()
    df.show(5)

    println(
      "\nCount tag null: "+ df.filter($"tag".isNull).count()
        + "\nCount parentId null: "+ df.filter($"parentId".isNull).count() )

    // Filter posts with a score greater than 20
    val highScorePosts = df
      .filter(col("score") > 20)

    highScorePosts.show(5)

    // Register the DataFrame as a SQL temporary view
    df.createOrReplaceTempView("stackoverflow")

    // Query: Top 5 highest scores
    val top5Scores = spark.sql("SELECT id, score FROM stackoverflow ORDER BY score DESC LIMIT 5")
    top5Scores.show()

    val top5ScoresWithTag = spark.sql("""
        SELECT id, score, tag
        FROM stackoverflow
        WHERE tag IS NOT NULL
        ORDER BY score DESC
        LIMIT 5
      """)
    top5ScoresWithTag.show()

    // Query: Most frequently used tags
    val popularTags = spark.sql("""
      SELECT tag, COUNT(*) as frequency
      FROM stackoverflow
      WHERE tag IS NOT NULL
      GROUP BY tag
      ORDER BY frequency DESC
      LIMIT 10
    """)
    popularTags.show()


    spark.stop()
  }
}