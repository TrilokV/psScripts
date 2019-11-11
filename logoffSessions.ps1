$userName = Read-Host -Prompt 'Enter User name [FirstInitialLastname] '
$serverName = Read-Host -Prompt 'Enter computer/server name: [get this info from Kibana: https://log.acmeunited.com] '


#Write-Host "You input server '$serverName' and user '$userName'

$sessionID = ((quser /server:$serverName | Where-Object {$_ -match $username}) -split ' +')[2]
if(!$sessionID -gt 0){
    Write-Host 'No Active sessions'
}
else {
    logoff $sessionID /server:$serverName
    Write-Host "User has been logged off from the server/computer '$serverName'."
}