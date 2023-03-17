$IMDomainList = Import-CSV -Path "C:\Accepted_Domains_List_O365.csv"

Foreach ($domain in $IMDomainList) 
    { 
    Get-SPFRecord -Name $domain.Domains |  Export-CSV -Append "C:\SPF_Record.csv" -NoTypeInformation
    }