org="technology-core"
baseurl="https://app.terraform.io"
workspacesUrl="$baseurl/api/v2/organizations/$org/workspaces"
echo $workspacesUrl


echo "workspaceName | current-run | latest-run | current-state-version" >> tfresponse.json
echo "----------------------------------------------------------" >> tfresponse.json

ls
# for workspace in $workspaceData
cat ws.txt | while read workspace;
do 
    if [[ "$workspace" == "wsname" ] || [ "$workspace" == "------" ]];
    then
        echo "not a workspace"
    else
        echo $workspace
        # api=$(curl \
        # --header "Authorization: Bearer $tfe_token" \
        # --header "Content-Type: application/vnd.api+json" \
        # "$workspacesUrl/$workspace" | jq '.data.attributes.name, "|", .data.relationships."current-run".data, "|", .data.relationships."latest-run".data, "|", .data.relationships."current-state-version".data' )
        
        # echo $api >> tfresponse.json
    fi
done
