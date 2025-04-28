// ==-----------------------------------------------------------== //
// SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
//
// SPDX-License-Identifier: Apache-2.0
// ==-----------------------------------------------------------== //

plugins {
  id("org.pkl-lang") version "0.27.2"
}

pkl {
  evaluators {
    register("evalStdSchemaV1") {
      projectDir.set(file("."))
      sourceModules.set(fileTree(projectDir) { include("*.pkl") })
      outputFile.set(file("${layout.buildDirectory.get()}/%{moduleName}.%{outputFormat}"))
    }
  }

  tests {
    register("testStdSchemaV1") {
      projectDir.set(file("."))
      sourceModules.set(fileTree(projectDir) { include("tests/*.pkl") })
      overwrite.set(false)
    }
  }

  project {
    resolvers {
      register("resolveStdSchemaV1") {
        projectDirectories.from(file("."))
      }
    }

    packagers {
      register("makeStdSchemaV1Pkg") {
        projectDirectories.from(file("."))
      }
    }
  }
}
