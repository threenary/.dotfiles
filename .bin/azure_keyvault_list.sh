# Lists Key Value pair from keyvault
initialSubscription=$(az account show | jq '.name' -r)
subscriptions=($(az account list | jq '.[] | .name' -r))
select sub in "${subscriptions[@]}"; do
	$(az account set --subscription $sub)
	break
done

if [ -z "$1" ]; then
	keyVaultList=($(az keyvault list | jq '.[] | .name' -r | sort -f))
	select item in "${keyVaultList[@]}"; do
		keyVaultName=$item
		break
	done
else
	keyVaultName=$1
fi

az keyvault secret list --vault-name=$keyVaultName | jq '.[] | .name' -r | xargs -I {} -L 1 az keyvault secret show --vault-name=$keyVaultName --name={} | jq '{name: .name, value: .value}'