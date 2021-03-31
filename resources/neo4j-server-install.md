# Common Instructions

1. Download [Neo4j Community Server](https://neo4j.com/download-center/#community)
2. In the terminal:
   - `mkdir Neo4j`
   - `cd Neo4j`
3. Extract files in current directory
4. In the terminal, run `bin\neo4j console`

# Windows 10

1. If the following error is displayed, `Invoke-Neo4j : Unable to determine the path to java.exe`, [set or update](https://javatutorial.net/set-java-home-windows-10) environment variable `JAVA_HOME`.
2. Run `bin\neo4j console`, it should work now.

# MacOS (10.10.5 Yosemite)

1. If you have downloaded [Neo4j Community Edition 3.5.27](https://go.neo4j.com/download-thanks.html?edition=community&release=3.5.27&flavour=unix):

	1.1 If the following error is displayed, `Unable to find any JVMs matching version "1.8".`, run `brew install --cask adoptopenjdk8` to install requested OpenJDK version.

	1.2 If the following error is displayed, `Error: Cask 'adoptopenjdk8' is unavailable: No Cask with this name exists.`, run `brew install --cask homebrew/cask-versions/adoptopenjdk8`.
2. If you have downloaded [Neo4j Community Edition 4.2.4](https://go.neo4j.com/download-thanks.html?edition=community&release=4.2.4&flavour=unix):

	2.1 Download and install [OpenJDK version 11](https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.10%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz).
3. Run `bin\neo4j console`, it should work now.