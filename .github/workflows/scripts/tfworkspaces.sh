org="humana_tfe"
baseurl="https://automation.humana.com"
workspacesUrl="$baseurl/api/v2/organizations/$org/workspaces"
echo $workspacesUrl

# workspaceData=$(curl "$workspacesUrl" \
#   --header "Authorization: Bearer $tfe_token" \
#   --header "Content-Type: application/vnd.api+json" | jq -r '.data[].attributes.name')
# echo $workspaceData

rm -f tfresponse.json
echo "workspaceName | current-run | latest-run | current-state-version" >> tfresponse.json
echo "----------------------------------------------------------" >> tfresponse.json


# for workspace in $workspaceData
cat ws.txt | while read workspace || [[ -n $workspace ]];
do 
    echo $workspace
    api=$(curl \
    --header "Authorization: Bearer $tfe_token" \
    --header "Content-Type: application/vnd.api+json" \
    "$workspacesUrl/$workspace" | jq '.data.attributes.name, "|", .data.relationships."current-run".data, "|", .data.relationships."latest-run".data, "|", .data.relationships."current-state-version".data' )
    
    echo $api >> tfresponse.json
done
