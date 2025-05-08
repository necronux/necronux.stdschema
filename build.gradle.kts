// ==-----------------------------------------------------------== //
// SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
//
// SPDX-License-Identifier: Apache-2.0
// ==-----------------------------------------------------------== //

plugins {
  id("org.pkl-lang") version "0.28.2"
}

pkl {
  evaluators {
    register("evalStdSchema") {
      projectDir.set(file("."))
      sourceModules.set(fileTree(projectDir) { include("schema/*.pkl") })
      outputFile.set(file("${layout.buildDirectory.get()}/%{moduleName}.%{outputFormat}"))
    }
  }

  tests {
    register("testStdSchema") {
      projectDir.set(file("."))
      sourceModules.set(fileTree(projectDir) { include("tests/*.pkl") })
      overwrite.set(false)
    }
  }

  project {
    resolvers {
      register("resolveStdSchema") {
        projectDirectories.from(file("."))
      }
    }

    packagers {
      register("makeStdSchemaPkg") {
        projectDirectories.from(file("."))
      }
    }
  }
}
