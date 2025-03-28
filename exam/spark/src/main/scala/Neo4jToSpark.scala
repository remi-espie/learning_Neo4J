import org.apache.spark.sql.SparkSession

object Neo4jToSpark {
  def main(args: Array[String]): Unit = {

    // Init values
    val url = "bolt://35.174.107.56"
    val username = "neo4j"
    val password = "concepts-lifeboat-pieces"
    val dbname = "neo4j"

    // Create a Spark session with custom configurations
    val spark = SparkSession.builder
      .appName("Neo4J to spark Application")
      .master("local[*]") // Run locally using all available CPU cores
      .config("neo4j.url", url)
      .config("neo4j.authentication.basic.username", username)
      .config("neo4j.authentication.basic.password", password)
      .config("neo4j.database", dbname)
      .getOrCreate()

    // Read from Neo4j
    val readQuery =
      """
      MATCH (:Client:FirstPartyFraudster)-[]-(txn:Transaction)-[]-(c:Client)
      WHERE NOT c:FirstPartyFraudster
      UNWIND labels(txn) AS transactionType
      RETURN transactionType, count(*) AS freq
      """

    val df = spark.read
      .format("org.neo4j.spark.DataSource")
      .option("query", readQuery)
      .load()

    // Show the DataFrame
    df.show()

    // Stop the Spark session
    spark.stop()
  }
}