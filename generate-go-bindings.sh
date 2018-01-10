#!/bin/bash

docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
    -c config.json
    -i local/pdns/docs/http-api/swagger/authoritative-api-swagger.yaml \
    -l go \
    -o /local/out/go
