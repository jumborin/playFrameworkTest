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

resolvers += "Maven Central" at "https://repo1.maven.org/maven2/"

resolvers += "Lightbend Releases" at "https://repo.lightbend.com/lightbend/maven-releases/"
