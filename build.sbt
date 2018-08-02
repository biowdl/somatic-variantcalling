organization := "com.github.biopet"
organizationName := "Biowdl"
name := "somatic-variantcalling"

biopetUrlName := "somatic-variantcalling"

startYear := Some(2018)

biopetIsTool := false

developers ++= List(
  Developer(id = "ffinfo",
            name = "Peter van 't Hof",
            email = "pjrvanthof@gmail.com",
            url = url("https://github.com/ffinfo")),
  Developer(id = "DavyCats",
            name = "Davy Cats",
            email = "d.cats@lumc.nl",
            url = url("https://github.com/DavyCats"))
)

scalaVersion := "2.11.12"

libraryDependencies += "com.github.biopet" %% "biowdl-test-utils" % "0.1-SNAPSHOT" % Test changing ()
libraryDependencies += "com.github.biopet" %% "ngs-utils" % "0.4"
