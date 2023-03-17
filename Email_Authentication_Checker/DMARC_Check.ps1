$IMDomainList = Import-CSV -Path "C:\Accepted_Domains_List_O365.csv"

Foreach ($domain in $IMDomainList) 
    { 
    Get-DMARCRecord -Name $domain.Domains |  Export-CSV -Append "C:\DMARCRecord.csv" -NoTypeInformation
    }