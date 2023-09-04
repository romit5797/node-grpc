#!/bin/bash

PROTO_DIR=./proto
DEST_DIR=./proto/generated

# Generate JavaScript code
npx grpc_tools_node_protoc \
    --js_out=import_style=commonjs,binary:${DEST_DIR} \
    --grpc_out=${DEST_DIR} \
    --plugin=protoc-gen-grpc=./node_modules/.bin/grpc_tools_node_protoc_plugin \
    -I ./proto \
    ${PROTO_DIR}/*.proto

# Generate TypeScript code (d.ts)
npx grpc_tools_node_protoc \
    --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts \
    --ts_out=${DEST_DIR} \
    -I ./proto \
     ${PROTO_DIR}/*.proto
    