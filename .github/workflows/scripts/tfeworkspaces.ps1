$tfetoken = $Env:tfe_token
$org = $Env:org
$baseUrl = $Env:baseurl
$Headers = @{
    Authorization  = "Bearer $tfetoken"
    "Content-Type" = "application/vnd.api+json"
}

$baseUrl = "$baseUrl/$org/workspaces"

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

