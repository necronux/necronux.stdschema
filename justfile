# ==-----------------------------------------------------------== #
# SPDX-FileCopyrightText: © 2025 Nayan Patil <nayantsg@proton.me>
#
# SPDX-License-Identifier: Apache-2.0
# ==-----------------------------------------------------------== #

sbom:
    reuse lint
    reuse spdx -o reuse.spdx

runpkl:
    just resolve-stdschema
    just eval-stdschema
    just test-stdschema

# Following subcommands are used in ci

resolve-stdschema:
    ./gradlew resolveStdSchemaV1

eval-stdschema:
    ./gradlew evalStdSchemaV1

test-stdschema:
    ./gradlew testStdSchemaV1

make-stdschemapkg:
    ./gradlew makeStdSchemaV1Pkg
