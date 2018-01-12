#!/bin/bash

set -euxo pipefail

wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.0/swagger-codegen-cli-2.3.0.jar -O swagger-codegen-cli.jar

java -jar swagger-codegen-cli.jar generate \
    -c swagger-config.json \
    -i pdns/docs/http-api/swagger/authoritative-api-swagger.yaml \
    -l go \
    -o out/go

tree out/go
