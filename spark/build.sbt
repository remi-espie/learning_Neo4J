name := "Simple Project"

version := "1.0"

scalaVersion := "2.12.18"

libraryDependencies += "org.apache.spark" %% "spark-sql" % "3.5.5"

libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % "3.5.5",
  "org.apache.hadoop" % "hadoop-common" % "3.4.1",
  "org.apache.hadoop" % "hadoop-aws" % "3.4.1",
)
