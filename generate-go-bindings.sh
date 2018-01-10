#!/bin/bash

set -euxo pipefail

sudo docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
    -c /local/swagger-config.json \
    -i /local/pdns/docs/http-api/swagger/authoritative-api-swagger.yaml \
    -l go \
    -o /local/out/go
