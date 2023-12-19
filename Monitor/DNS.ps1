$Settings = Get-Content -Path .\Settings.json | ConvertFrom-Json

foreach ($record in $Settings.DNS.Internal.Records) {
    if ([String]::IsNullOrEmpty($record.Name)) {
        $Query = @{
            Name = $Settings.DNS.Internal.Domain
            Type = $record.Type
            Server = $Settings.DNS.Internal.Server
        }
        try {
            $Result = Resolve-DnsName @Query -DnsOnly -ErrorAction Stop
            $Result | Select-Object -Property Name,Type,IPAddress | Format-Table -AutoSize
        }
        catch {
            Write-Host $Query -ForegroundColor Red
        }
        
    }
    else {
        $Query = @{
            Name = "$($record.Name).$($Settings.DNS.Internal.Domain)"
            Type = $record.Type
            Server = $Settings.DNS.Internal.Server
        }
        try {
            $Result = Resolve-DnsName @Query -DnsOnly -ErrorAction Stop
            $Result | Select-Object -Property Name,Type,IPAddress | Format-Table -AutoSize
        }
        catch {
            Write-Host @Query -ForegroundColor Red
        }
    }
}