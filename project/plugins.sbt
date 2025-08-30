// Comment to get more information during initialization
logLevel := Level.Warn

// Maven Central and alternative repositories
resolvers += "Maven Central" at "https://repo1.maven.org/maven2/"

resolvers += "Lightbend Releases" at "https://repo.lightbend.com/lightbend/maven-releases/"

resolvers += "Sonatype OSS" at "https://oss.sonatype.org/content/repositories/releases/"

// Use the Play sbt plugin for Play projects
addSbtPlugin("com.typesafe.play" % "sbt-plugin" % "2.2.2")