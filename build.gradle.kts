// ==-----------------------------------------------------------== //
// SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
//
// SPDX-License-Identifier: Apache-2.0
// ==-----------------------------------------------------------== //

plugins {
  id("org.pkl-lang") version "0.30.2"
  base
}

pkl {
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

  pkldocGenerators {
    register("makeStdSchemaPklDoc") {
      projectDir.set(file("."))
      sourceModules.set(fileTree(projectDir) {
        include("stdschema/*.pkl")
        include("doc-package-info.pkl")
        include("docsite-info.pkl")
      })
      outputDir = (layout.projectDirectory.dir("tmp-docs"))
    }
  }
}

tasks.check {
  dependsOn("makeStdSchemaPklDoc")
}
