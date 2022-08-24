if (test-path ws.txt){
    write-host "removing file"
    remove-item ws.txt
}
if (test-path tfresponse.txt) {
    write-host "removing file"
    remove-item tfresponse.txt
}
if (test-path workspace.txt) {
    write-host "removing file"
    remove-item workspaces.txt
}