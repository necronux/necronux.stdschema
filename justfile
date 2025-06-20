# ==-----------------------------------------------------------== #
# SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
#
# SPDX-License-Identifier: Apache-2.0
# ==-----------------------------------------------------------== #

sbom:
    reuse lint
    reuse spdx -o reuse.spdx

runpkl:
    just resolve
    just eval
    just test

resolve:
    just resolve-stdschema
    just resolve-stdschemapklci

eval:
    just eval-stdschemapklci

test:
    just test-stdschema

# Following subcommands are used in ci

resolve-stdschemapklci:
    ./gradlew resolveStdSchemaPklCi

resolve-stdschema:
    ./gradlew resolveStdSchema

eval-stdschemapklci:
    ./gradlew evalStdSchemaPklCiModules
    ./gradlew evalStdSchemaPklCiWorkflows

test-stdschema:
    ./gradlew testStdSchema

make-stdschemapkg:
    ./gradlew makeStdSchemaPkg
