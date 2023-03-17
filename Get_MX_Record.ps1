$IMDomainList = Import-CSV -Path "C:\Accepted_Domains_List_O365.csv"

Foreach ($domain in $IMDomainList)
    { 
    Resolve-DnsName -Name $domain.Domains -Type MX | Export-CSV -Append "C:\MX_Record.csv" -NoTypeInformation -Force
    }