#!/bin/bash

curl -LO https://releases.hashicorp.com/vault/1.13.2/vault_1.13.2_linux_amd64.zip

unzip vault_1.13.2_linux_amd64.zip

mv vault /usr/local/bin/