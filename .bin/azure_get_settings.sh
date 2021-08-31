# Downloads and decripts local.settings.json

initialSubscription=$(az account show | jq '.name' -r)
subscriptions=($(az account list | jq '.[] | .name' -r))
select sub in "${subscriptions[@]}"; do
	$(az account set --subscription $sub)
	break
done

if [ -z "$1" ]; then
	functionNameArray=($(az functionapp list | jq '.[] | .name' -r | sort -f))
	select item in "${functionNameArray[@]}"; do
		functionAppName=$item
		break
	done
else
	functionAppName=$1
fi

func azure functionapp fetch-app-settings "$functionAppName" && func settings decrypt
cp local.settings.json local.settings.json.backup

secretNameArray=($(jq '.Values | .[] | strings | if startswith("@") then . else empty end' -r local.settings.json))

for i in "${secretNameArray[@]}"; do
	keyvaultName=$(echo "$i" | awk -F/ '{ print $3 }' | awk -F. '{ print $1}')
	secretName=$(echo "$i" | awk -F/ '{ print $5 }')
	newSecret=$(az keyvault secret show --vault-name "$keyvaultName" -n "$secretName" | jq '.value' -r)
	cp local.settings.json local.settings.json.temp
	jq --arg oldVal "$i" --arg newVal "$newSecret" '.Values[] |= if . == $oldVal then .=$newVal else . end' local.settings.json.temp >local.settings.json
done
rm local.settings.json.temp
$(az account set --subscription $initialSubscription)
