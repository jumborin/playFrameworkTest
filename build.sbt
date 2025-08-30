name := "fib6"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  "org.specs2" %% "specs2" % "2.3.11" % "test",
  "junit" % "junit" % "4.11" % "test"
)     

play.Project.playScalaSettings

resolvers += "Typesafe Releases" at "https://repo.typesafe.com/typesafe/releases/"

resolvers += "Typesafe Ivy Releases" at "https://repo.typesafe.com/typesafe/ivy-releases/"
