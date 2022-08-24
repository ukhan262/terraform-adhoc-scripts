if (test-path ws.txt){
    write-host "removing file"
    remove-item ws.txt
}
if (test-path tfresponse.json) {
    write-host "removing file"
    remove-item tfresponse.json
}
if (test-path workspace.txt) {
    write-host "removing file"
    remove-item workspaces.txt
}