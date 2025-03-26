import org.apache.spark.sql.SparkSession

object Neo4J {
  def main(args: Array[String]): Unit = {

    // Replace with the actual connection URI and credentials
    val url = "bolt://localhost:7687"
    val username = "neo4j"
    val password = "password"
    val dbname = "neo4j"

    val spark = SparkSession.builder
      .appName("Neo4J")
      .master("local[*]")
      .config("neo4j.url", url)
      .config("neo4j.authentication.basic.username", username)
      .config("neo4j.authentication.basic.password", password)
      .config("neo4j.database", dbname)
      .getOrCreate()

    spark.sparkContext.setLogLevel("ERROR")

    val readQuery =
      """
      MATCH (n)
      RETURN COUNT(n)
      """

    val df = spark.read
      .format("org.neo4j.spark.DataSource")
      .option("query", readQuery)
      .load()

    df.show()
  }
}