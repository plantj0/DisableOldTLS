if ((Get-ItemPropertyValue -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server\" -Name "Enabled") -eq '1')


{
    write-host "TLS 1.2 is enabled. Proceeding." -fore green 
    if ((Get-ItemPropertyValue -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server\" -Name "Enabled") -eq '1')
        {
        #Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" -name "Enabled" -value '0'
        #Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.1\Server" -name "DisabledByDefault" -value '1'
        Write-host "TLS 1.1 was enabled. We disabled it for you!" -back green -fore black
        }
        Else
        {
        Write-host "TLS 1.1 already disabled, no action needed."
        }
    if ((Get-ItemPropertyValue -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server\" -Name "Enabled") -eq '1')
        {
        #Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -name "Enabled" -value '0'
        #Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.0\Server" -name "DisabledByDefault" -value '1'
        Write-host "TLS 1.0 was enabled. We disabled it for you!" -back green -fore black
        }
        Else
        {
        Write-host "TLS 1.0 already disabled, no action needed."
        }
    
}
else
{
   write-host "TLS 1.2 has not been enabled. Script will be terminated. Be sure to enable TLS 1.2 before you proceed." 
}
Write-host "Finished script. Please verify results on https://www.ssllabs.com/ssltest/analyze.html" -fore green