# Common Instructions

1. Download [Neo4j Community](https://neo4j.com/download-center/#community)
2. In the terminal:
   - `mkdir Neo4j`
   - `cd Neo4j`
3. Extract files in current directory
4. In the terminal, run `bin\neo4j console`

# Windows 10

1. If the following error is displayed, `Invoke-Neo4j : Unable to determine the path to java.exe`, [set or update](https://javatutorial.net/set-java-home-windows-10) environment variable `JAVA_HOME`.
2. Should work now.

# MacOS (10.10.5 Yosemite)

1. If the following error is displayed, `Unable to find any JVMs matching version "1.8".`, run `brew install --cask adoptopenjdk8` to install requested OpenJDK version.
2. If the following error is displayed, `Error: Cask 'adoptopenjdk8' is unavailable: No Cask with this name exists.`, run `brew install --cask homebrew/cask-versions/adoptopenjdk8`.
3. Should work now.