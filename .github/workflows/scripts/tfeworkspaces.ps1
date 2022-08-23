$tfetoken = $Env:tfe_token
$org = "technology-core"
$Headers = @{
    Authorization  = "Bearer $tfetoken"
    "Content-Type" = "application/vnd.api+json"
}

$baseUrl = "https://app.terraform.io/api/v2/organizations/$org/workspaces"

$i = 1
for (($i -eq 1); $i -lt 5; $i++)
{
    $body = @{
        "page[size]"   = "1"
        "page[number]" = $i
    }
    $body
    $response = Invoke-RestMethod -Uri $baseUrl -Headers $Headers -Body $body
    $allWorkspaces = $response.data | select @{ Name="wsname";  Expression={$_.attributes.name} };
    $allWorkspaces >> ws.txt
}

