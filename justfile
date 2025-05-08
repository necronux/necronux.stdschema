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

resolve:
    just resolve-stdschema
    just resolve-stdschemapklci

eval:
    just eval-stdschema
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

eval-stdschema:
    ./gradlew evalStdSchema

test-stdschema:
    ./gradlew testStdSchema

make-stdschemapkg:
    ./gradlew makeStdSchemaPkg
