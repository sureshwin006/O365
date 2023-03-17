$IMDomainList = Import-CSV -Path "C:\Accepted_Domains_List_O365.csv"

$exportdata = @()

$OutputObjects = Foreach ($domain in $IMDomainList) {
 
$domaindkim = Get-DKIMRecord $domain.Domains

$results =$domaindkim | ForEach-Object { 

    [PSCustomObject]@{
        Domain = $_.Name
        DkimRecord = $_.DkimRecord | Out-String
        DkimSelector = $_.DkimSelector
        DKIMAdvisory = $_.DKIMAdvisory } 
}

$exportdata = $results
$DesktopPath = "C:\"
$exportdata | Export-Csv -Append ($DesktopPath + "DKIMRecord.csv") -NoTypeInformation 
}

