#-----------------------------------------------
#function Name : p
# Test if a computer is online ( quick ping replacement)
#-----------------------------------------------
function p {
    param($computername)
    return (test-connection $computername -count 1 -quiet)
}
#-----------------------------------------------
#function Name : Get-LoggedIn
# Return the current logged-In user of a remote machine.
#-----------------------------------------------
function Get-LoggedIn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True)]
        [string[]]$computername
    )
    foreach ($pc in $computername){
        $logged_in = ( gmwi win32_computersystem -COMPUTER $pc).username 
        $name = $logged_in.split('\')[1]
        "{0}: {1}" -f $pc, $name
    }
}