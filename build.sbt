name := "fib6"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  "org.specs2" %% "specs2" % "2.3.11" % "test"
)     

play.Project.playScalaSettings
