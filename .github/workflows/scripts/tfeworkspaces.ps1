$tfetoken = $Env:tfe_token
$org = "technology-core"
$Headers = @{
    Authorization  = "Bearer $tfetoken"
    "Content-Type" = "application/vnd.api+json"
}

$baseUrl = "https://app.terraform.io/api/v2/organizations/$org/workspaces"


if (test-path ws.txt){
    write-host "removing file"
    remove-item ws.txt
}

$body = @{
    "page[size]"   = "5"
    "page[number]" = "1"
}

$response = Invoke-RestMethod -Uri $baseUrl -Headers $Headers -Body $body
$allWorkspaces = $response.data | select @{Expression={$_.attributes.name}};
$allWorkspaces >> ws.txt
