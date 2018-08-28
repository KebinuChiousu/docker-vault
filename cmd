#!/bin/bash
CONTAINER=vault

docker exec -e VAULT_ADDR='http://127.0.0.1:8200' $CONTAINER $*
