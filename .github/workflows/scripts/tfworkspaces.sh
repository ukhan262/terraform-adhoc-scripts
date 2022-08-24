workspacesUrl="$baseurl/$org/workspaces"
echo $workspacesUrl


echo "workspaceName | current-run | latest-run | current-state-version" >> tfresponse.json
echo "----------------------------------------------------------" >> tfresponse.json

# for workspace in $workspaceData
cat workspaces.txt | while read workspace;
do 
    if [[ "$workspace" == "wsname" ]]; then
        echo "not a workspace"
    elif [[ "$workspace" == "------" ]]; then
        echo "lines in the file"
    else
        echo $workspace
        api=$(curl \
        --header "Authorization: Bearer $tfe_token" \
        --header "Content-Type: application/vnd.api+json" \
        "$workspacesUrl/$workspace" | jq '.data.attributes.name, "|", .data.relationships."current-run".data, "|", .data.relationships."latest-run".data, "|", .data.relationships."current-state-version".data' )
        
        echo $api >> tfresponse.json
    fi
done
