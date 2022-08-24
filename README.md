# terraform-adhoc-scripts
## powershell script
This script lists all the workspaces in the organization. If there are more than 100 workspaces, the loop needs to be modified. In case, if the total worksapces are 480 then, the $i -lt 6 to be able to get all the workspaces.
Then the file is output as ws.txt

## bash script
The bash script loops through workspace.txt file which is grep version of ws.txt and then gets the data for each workspace and outputs that to tfresponse.txt

## workflow
* The repo is cleaned up with files that will be created later
* PS script runs to generate the ws.txt
* bash command to grep ws.txt to workspaces.txt
* Bash script runs to get detailed information on all workspaces in a file tfresponse.txt
* The files are checked back into the repository
