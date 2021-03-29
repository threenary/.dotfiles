#!/bin/sh

# Lists Key Value pair from keyvault
az keyvault secret list --vault-name=ON-Keys-PROD | jq '.[] | .name' -r | xargs -I {} -L 1 az keyvault secret show --vault-name=ON-Keys-PROD --name={} | jq '{name: .name, value: .value}'