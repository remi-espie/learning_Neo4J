name := "Simple Project"

version := "1.0"

scalaVersion := "2.12.18"

libraryDependencies += "org.apache.spark" %% "spark-sql" % "3.5.1"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "3.5.5",
  "org.apache.hadoop" % "hadoop-common" % "3.3.1",
  "org.apache.hadoop" % "hadoop-aws" % "3.3.1",
  "org.neo4j" % "neo4j-connector-apache-spark_2.12" % "5.3.5_for_spark_3",
  "org.mongodb.spark" % "mongo-spark-connector_2.12" % "10.4.1",
)

assemblyMergeStrategy in assembly := {
  case PathList("META-INF", xs @ _*) => MergeStrategy.discard
  case x => MergeStrategy.first
}

assemblyJarName in assembly := "Simple_Project-assembly-1.0.jar"
